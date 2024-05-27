// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:floading/floading.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lunarestate/Widgets/Utils.dart';

import '../../Service/UserData.dart';
import '../../Service/sharedPref.dart';
import '../../Widgets/roundbutton.dart';
import '../../Widgets/textBox.dart';
import 'package:provider/provider.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _phone = TextEditingController();
  File? profileImage;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      _data();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _data() {
    _name.text = Provider.of<UserData>(context, listen: false).name.toString();
    _email.text =
        Provider.of<UserData>(context, listen: false).email.toString();
    _phone.text =
        Provider.of<UserData>(context, listen: false).phone.toString();
  }

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      profileImage = File(image.path);
      setState(() => this.image = profileImage);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CustomAppBarwithBackButton('Account Information'),
              ];
            },
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                      onTap: pickImage,
                      child: SizedBox(
                        child: profileImage != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(profileImage!),
                                radius: 15,
                              )
                            : Hero(
                                tag: 'profileImage',
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    Provider.of<UserData>(context, listen: true)
                                        .profile
                                        .toString(),
                                  ),
                                  onBackgroundImageError:
                                      (exception, stackTrace) {
                                    Icon(
                                      Icons.broken_image,
                                      color: Colors.red,
                                      size: 30,
                                    );
                                  },
                                  radius: 15,
                                ),
                              ),
                        height: 125,
                        width: 125,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textBox(
                        icon: Icons.person,
                        emailController: _name,
                        Ktype: TextInputType.name,
                        hint: 'Name'),
                    SizedBox(
                      height: 15,
                    ),
                    textBox(
                        icon: Icons.email_outlined,
                        Ktype: TextInputType.emailAddress,
                        emailController: _email,
                        hint: 'Email'),
                    SizedBox(
                      height: 15,
                    ),
                    textBox(
                        icon: Icons.phone,
                        Ktype: TextInputType.number,
                        emailController: _phone,
                        hint: 'Phone'),
                    SizedBox(
                      height: 25,
                    ),
                    roundButton(
                      onClick: (() async {
                        if (_name.text == '' ||
                            _phone.text == '' ||
                            _email.text == '') {
                          Utils()
                              .showSnackbar('Enter Value', Colors.red, context);
                        } else {
                          FLoading.show(
                            context,
                            loading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/icon.png",
                                  width: 200,
                                  height: 200,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                CircularProgressIndicator()
                              ],
                            ),
                            closable: false,
                            color: Colors.black.withOpacity(0.7),
                          );

                          var res = profileImage != null
                              ? await backend().updateAccountwithImage({
                                  'id': Provider.of<UserData>(context,
                                          listen: false)
                                      .id,
                                  'name': _name.text,
                                  'email': _email.text,
                                  'phone': _phone.text,
                                }, profileImage!)
                              : await backend().updateAccountwithOutImage({
                                  'userid': Provider.of<UserData>(context,
                                          listen: false)
                                      .id,
                                  'name': _name.text,
                                  'email': _email.text,
                                  'phone': _phone.text,
                                  'token': TOKEN,
                                });
                          debugPrint('profile $res is that');
                          if (res['status'] == 'success') {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('email', _email.text);
                            sharedPref().saveuserData(res['user']);
                            FLoading.hide();
                            Utils().showSnackbar(
                                'Changes Saved!', Colors.green, context);

                            await Provider.of<UserData>(context, listen: false)
                                .initUserData();
                            Navigator.pop(context);
                          } else {
                            FLoading.hide();
                            Utils()
                                .showSnackbar(res['msg'], Colors.red, context);
                          }
                        }
                      }),
                      text: 'UPDATE',
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff141414),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              height: size.height,
              width: double.infinity,
            ),
          ),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            opacity: 0.2,
            image: AssetImage(
              'assets/images/tower.jpg',
            ),
            fit: BoxFit.cover,
          )),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
