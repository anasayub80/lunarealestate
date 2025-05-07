import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import '../Service/backend.dart';
import '../Widgets/customAppBar.dart';
import '../Widgets/header_text.dart';

class ClientInformationPage extends StatelessWidget {
  final String uid;
  const ClientInformationPage({super.key, required this.uid});
  Future getUserData() async {
    var res = await Backend().fetchUserDetail({
      "user_id": uid,
    });
    if (res['status'] == 'success') {
      return res;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: Column(
          children: [
            10.height,
            CustomAppBarWithCircleback().addPadding(left: 12),
            15.height,
            getHeader('Client Information').addPadding(
              horizontal: 8,
              top: 12,
            ),
            20.height,
            FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = snapshot.data['data'];
                return Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(data['profile']),
                        onBackgroundImageError: (exception, stackTrace) {
                          Icon(
                            Icons.broken_image,
                            color: Colors.red,
                            size: 30,
                          );
                        },
                      ),
                      10.height,
                      Text(
                        data['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      10.height,
                      Text(
                        data['email'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      10.height,
                      Text(
                        data['phone'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      10.height,
                      Text(
                        data['address'] ?? '',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      10.height,
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// fetchUserDetail {status: success, msg: User details found,
// data: {id: 4405, name: Anas Ayub, email: user@sample.com, username: , 
// phone: +923283567332, address: null, country: null, 
//role_id: 3, code: 592085, status: 1, 
//profile: 180920242026311000011608.jpg, 
//phone_verified: 1}}
