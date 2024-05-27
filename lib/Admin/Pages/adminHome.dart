import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/Pages/SellerRequestPage.dart';
import 'package:lunarestate/Admin/Pages/PurchasedProp.dart';
import 'package:lunarestate/Admin/Pages/UserListPage.dart';
import 'package:provider/provider.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:page_transition/page_transition.dart';
import '../../Pages/ProfilePage/ProfilePage.dart';
import '../../Service/UserData.dart';
import '../../Widgets/adminCard.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LunaE Admin'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: ProfilePage(),
                        type: PageTransitionType.bottomToTop));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  Provider.of<UserData>(context, listen: true)
                      .profile
                      .toString(),
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image,
                      color: Colors.red,
                      size: 30,
                    );
                  },
                ),
              ),
            ),
          )
        ],
        backgroundColor: AppThemes.bgColor,
        elevation: 0,
      ),
      // drawer: admimDrawer(),
      backgroundColor: AppThemes.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return propertyListPage(
                            title: 'Sellers Requests',
                          );
                        },
                      ));
                    },
                    child: card('assets/icons/sale.png', 'Sellers Request'),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return purchasedPropPage(
                              title: 'Purchased Property',
                            );
                          },
                        ));
                      },
                      child: card(
                          'assets/icons/purchased.png', 'Purchased Property')),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return userListPage(
                              title: 'Users',
                            );
                          },
                        ));
                      },
                      child: card('assets/icons/user.png', 'Users')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
