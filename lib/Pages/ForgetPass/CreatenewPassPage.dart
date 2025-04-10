import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Splash/SplashPage.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:floading/floading.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import '../../Service/backend.dart';

class CreatenewPassPage extends StatelessWidget {
  final String email;
  CreatenewPassPage({super.key, required this.email});
  final TextEditingController _pass1 = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgOne(
        child: SingleChildScrollView(
          child: Column(
            children: [
              50.height,
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      context.popFromScreen();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      size: 35,
                      color: Colors.white,
                    )),
              ),
              30.height,
              Image.asset(
                'assets/images/otp.gif',
                fit: BoxFit.fill,
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Create New Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              PassTextBox(
                  passwordController: _pass1, hint: 'Enter new password'),
              SizedBox(
                height: 20,
              ),
              PassTextBox(
                  passwordController: _pass2, hint: "Re enter password"),
              SizedBox(
                height: 25,
              ),
              roundButton(
                  onClick: () async {
                    if (_pass1.text.trim().isNotEmpty ||
                        _pass2.text.trim().isNotEmpty) {
                      if (_pass1.text == _pass2.text) {
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
                        var res = await backend().setNewAccount({
                          'newpswd': _pass1.text,
                          "email": email,
                        });

                        if (res == '1') {
                          FLoading.hide();
                          Utils.showSnackbar('Password Change Successfully',
                              Colors.green, context);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return SplashPage();
                            },
                          ));
                        } else {
                          Utils.showSnackbar(
                              'Invalid Details!', Colors.red, context);
                        }
                      } else {
                        Utils.showSnackbar(
                            'Password Not Match!', Colors.red, context);
                      }
                    } else {
                      Utils.showSnackbar('Enter Password', Colors.red, context);
                    }
                  },
                  text: 'Confirm Password')
            ],
          ).addPadding(horizontal: 25),
        ),
      ),
    );
  }
}
