import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';

import '../../../Config/config.dart';
import '../../../Service/backend.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
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
                      'Notifications',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Outfit'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: Backend().fetchNotifications(context),
                    builder: (context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                              'Something wrong \n ${snapshot.error}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ));
                          } else if (snapshot.data != null) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return null;
                              },
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
                                  'You don\'t have any notification',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            );
                          }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
