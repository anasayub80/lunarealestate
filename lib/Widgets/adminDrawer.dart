// import 'package:flutter/material.dart';
// import 'package:lunarestate/Admin/AppTheme.dart';
// import 'package:lunarestate/Service/sharedPref.dart';

// class admimDrawer extends StatelessWidget {
//   const admimDrawer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var currentTime = TimeOfDay.now();

//     return Drawer(
//       child: Column(
//         children: [
//           timeHeader(currentTime.format(context)),
//           ListTile(
//             title: Text('Home'),
//             selected: true,
//             leading: Icon(Icons.home),
//           ),
//           ListTile(
//             title: Text('Log Out'),
//             onTap: () {
//               sharedPref().logOut(context);
//             },
//             leading: Icon(Icons.logout),
//           )
//         ],
//       ),
//     );
//   }

//   Widget timeHeader(String time) => DrawerHeader(
//         decoration: BoxDecoration(color: AppThemes().bgColor),
//         child: Center(
//           child: Text(
//             time,
//             style: TextStyle(
//                 fontSize: 50.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.w100),
//           ),
//         ),
//       );
// }
