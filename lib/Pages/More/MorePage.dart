import 'package:flutter/material.dart';
import 'package:lunarestate/Pages/More/Pages/AboutUs.dart';
import 'package:lunarestate/Pages/More/Pages/TermsAndCondition.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:provider/provider.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../Widgets/customAppBar.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(
                  'assets/images/tower.jpg',
                ),
                fit: BoxFit.cover,
              )),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CustomAppBar(Provider.of<UserData>(context, listen: false)
                    .name
                    .toString()),
              ];
            },
            body: Container(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AboutUsPage();
                          },
                        ));
                      },
                      title: Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        Icons.info,
                        color: mainColor,
                      ),
                      trailing: Icon(
                        Icons.arrow_right_alt,
                        color: mainColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TermsAndCondition();
                          },
                        ));
                      },
                      title: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        EvaIcons.fileTextOutline,
                        color: mainColor,
                      ),
                      trailing: Icon(
                        Icons.arrow_right_alt,
                        color: mainColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        backend().launchInBrowser(Uri.parse(
                            'https://sites.google.com/view/lunaenterprises/home'));
                      },
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        Icons.security,
                        color: mainColor,
                      ),
                      trailing: Icon(
                        Icons.arrow_right_alt,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        backend().launchInBrowser(
                            Uri.parse('https://lunaenterprises.info/'));
                      },
                      child: Text(
                        'lunaenterprises.info',
                        style: TextStyle(
                          color: Colors.amber,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                height: size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff141414),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
              ),
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    opacity: 0.2,
                    image: AssetImage(
                      'assets/images/tower.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
