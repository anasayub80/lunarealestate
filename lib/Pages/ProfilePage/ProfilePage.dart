import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Service/sharedPref.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/Widgets/custom_gradient_elevated_button.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Config/config.dart';
import '../../Service/UserData.dart';
import '../ForgetPass/ForgetPass.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<bool> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }

  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _phone = TextEditingController();
  File? profileImage;
  String countryCode = '+1';

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

    return Scaffold(
      body: BgTwo(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  20.height,
                  SafeArea(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.popFromScreen();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        20.width,
                        Text(
                          'Setting & Info',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Outfit'),
                        ),
                      ],
                    ),
                  ),
                  40.height,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: profileImage != null
                            ? CircleAvatar(
                                backgroundImage: FileImage(profileImage!),
                                radius: 15,
                              )
                            : Hero(
                                tag: "profileImage",
                                child: CircleAvatar(
                                  radius: 41,
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
                                ),
                              ),
                      ),
                      20.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Provider.of<UserData>(context, listen: true)
                                .name
                                .toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Outfit'),
                          ),
                          Text(
                            Provider.of<UserData>(context, listen: true)
                                .email
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontFamily: 'Outfit'),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'User Info',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textBox(
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'assets/icons/edit_pencil.svg',
                          color: AppThemes.secondarycolor,
                          height: 25,
                        ),
                      ),
                      icon: null,
                      controller: _name,
                      validator: (p0) {
                        return null;
                      },
                      Ktype: TextInputType.name,
                      hint: 'Name'),
                  SizedBox(
                    height: 20,
                  ),
                  textBox(
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'assets/icons/edit_pencil.svg',
                          color: AppThemes.secondarycolor,
                          height: 25,
                        ),
                      ),
                      icon: null,
                      controller: _email,
                      validator: (p0) {
                        return null;
                      },
                      Ktype: TextInputType.emailAddress,
                      hint: 'Email'),
                  20.height,
                  textBox(
                      suffix: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'assets/icons/edit_pencil.svg',
                          color: AppThemes.secondarycolor,
                          height: 25,
                        ),
                      ),
                      isSvg: true,
                      icon: CountryCodePicker(
                        onChanged: (c) {
                          setState(() {
                            countryCode = c.dialCode!;
                          });
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'US',
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.zero,
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                      controller: _phone,
                      validator: (p0) {
                        return null;
                      },
                      Ktype: TextInputType.phone,
                      hint: 'Phone'),
                  30.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Credential',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Outfit',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Change Password',
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            color: AppThemes.secondarycolor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ForgetMyPass(title: 'Change Password'),
                          isIos: true,
                          duration: Duration(milliseconds: 800),
                        ),
                      );
                    },
                    title: Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                      ),
                    ),
                    leading: Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    trailing: Icon(
                      Icons.arrow_right_alt,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.2,
                  ),
                  CustomGradientElevatedButton(
                      height: 55,
                      width: double.infinity,
                      gradient: LinearGradient(
                          colors: [Color(0xffa9aaac), Color(0xffa9aaac)]),
                      onPressed: () async {
                        if (_name.text == '' ||
                            _phone.text == '' ||
                            _email.text == '') {
                          Utils.showSnackbar(
                              'Enter Value', Colors.red, context);
                        } else {
                          FLoading.show(
                            context,
                            loading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/logo.png",
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
                            Utils.showSnackbar(
                                'Changes Saved!', Colors.green, context);

                            await Provider.of<UserData>(context, listen: false)
                                .initUserData();
                            Navigator.pop(context);
                          } else {
                            FLoading.hide();
                            Utils.showSnackbar(res['msg'], Colors.red, context);
                          }
                        }
                      },
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
                        ),
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            height: size.height,
            width: double.infinity,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
