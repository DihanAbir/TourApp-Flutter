
import 'package:flutter/material.dart';
import 'package:flutter_p32929/screens/Lognin/Login.dart';

class ProfileTabs extends StatefulWidget {
  @override
  _ProfileTabsState createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SignInScreen()
    );
  }
}

