import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/new/users/user_detailed_View.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Service/backend.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final controller = ScrollController();
  List? itemlist = [];
  int Limit = 20;
  @override
  void initState() {
    super.initState();
    fetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  StreamController _streamController = StreamController();

  bool hasMore = true;
  int page = 0;
  fetch() async {
    var newitems = await backend().fetchAdminUsers({'limit': page.toString()});
    setState(() {
      if (newitems != null) {
        page += 10;
        if (newitems.length <= 10) {
          hasMore = false;
        }
        itemlist!.addAll(newitems.map((item) {
          return item;
        }));
        _streamController.add(['hasData']);
      } else {
        _streamController.add(null);
        hasMore = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.height,
            CustomAppBarWithCircleback().addPadding(left: 12),
            20.height,
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Users',
                style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            10.height,
            StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());

                  default:
                    if (snapshot.hasError) {
                      return Text('Error');
                    } else if (snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          controller: controller,
                          itemCount: itemlist!.length + 1,
                          itemBuilder: (context, index) {
                            if (index < itemlist!.length) {
                              return UserTile(
                                profile: itemlist![index]['profile'],
                                name: itemlist![index]['name'],
                                id: itemlist![index]['id'],
                                phone: itemlist![index]['phone'],
                                email: itemlist![index]['email'],
                              ).addPadding(vertical: 10);
                            } else {
                              return hasMore
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : SizedBox.shrink();
                            }
                          },
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/noreccustom.gif',
                              width: 275,
                              height: 275,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            'NO USER FOUND',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: AppThemes.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'No registerd user found in Luna App.',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  UserTile({
    super.key,
    required this.profile,
    required this.phone,
    required this.id,
    required this.email,
    required this.name,
  });
  final String profile, name, id, phone, email;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushScreenTo(UserDetailedView(
          email: email,
          id: id,
          name: name,
          phone: phone,
          profile: profile,
        ));
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        profile,
                      ),
                    ).addPadding(horizontal: 12, vertical: 6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFFD3A45C),
                            fontSize: 16,
                          ),
                        ),
                        2.height,
                        Text(
                          phone,
                          style: TextStyle(
                            fontFamily: 'Outfit',

                            // color: Color(0xFFD3A45C),
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ).addPadding(vertical: 6),
                  ],
                ),
                // 6.width,
                InkWell(
                  onTap: () {
                    _makePhoneCall(phone);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/phone_icon.svg',
                      color: Colors.black,
                      height: 40,
                      fit: BoxFit.scaleDown,
                    ),
                    // backgroundImage:
                    //     SvgPicture.asset('assets/icons/phone_icon.svg') ,
                  ).addPadding(horizontal: 12, vertical: 6),
                ),
              ],
            ).addPadding(horizontal: 18, vertical: 12),
          ),
          Divider(
            thickness: 0.8,
            color: Color(0xff424448),
          ),
        ],
      ),
    );
  }
}
