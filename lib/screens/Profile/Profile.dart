import 'package:flutter/material.dart';
import 'package:flutter_p32929/screens/Profile/Deshboard.dart';
import 'package:flutter_p32929/screens/Profile/ProfileTabs.dart';


// class profile extends StatefulWidget {
//   @override
//   _profileState createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(length: 2, child: Scaffold(
//         appBar: AppBar(
//           title: Text("profile"),
//           toolbarHeight: 150,
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.perm_identity), text: 'Profile',),
//               Tab(icon: Icon(Icons.dashboard), text: 'Deshboard',),


//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           ProfileTabs(),
//           Dashboard(),
//         ],),
//       )),
//     );
//   }
// }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(length: 2, child: Scaffold(
        appBar: AppBar(
          title: Text("profile"),
          toolbarHeight: 150,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.perm_identity), text: 'Profile',),
              Tab(icon: Icon(Icons.dashboard), text: 'Deshboard',),


            ],
          ),
        ),
        body: TabBarView(children: [
          ProfileTabs(),
          Dashboard(),
        ],),
      )),
    );
  }
}