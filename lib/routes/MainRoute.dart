import 'package:flutter/material.dart';
import 'package:flutter_p32929/Newsfeed/NewsFeedServerCalling.dart';
import 'package:flutter_p32929/Widgets/curveNav.dart';

class MainRoute {
  static getDefaultLayout() {

  

    // 

    return MaterialApp(
    home: Scaffold(
      bottomNavigationBar: curveNav(),
      
    ),
  );
  }
}
