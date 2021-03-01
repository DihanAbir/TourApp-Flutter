import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_p32929/logics/ServerCalling.dart';
import 'package:flutter_p32929/screens/Bus.dart';
import 'package:flutter_p32929/screens/Hotel.dart';
import 'package:flutter_p32929/screens/Newsfeed.dart';
import 'package:flutter_p32929/screens/Post.dart';
import 'package:flutter_p32929/screens/Profile/Profile.dart';



class curveNav extends StatefulWidget {

  curveNav({Key key}) : super(key: key);

  @override
  _curveNavState createState() => _curveNavState();
}

class _curveNavState extends State<curveNav> {
  final pages = [Newsfeed(), Bus(), Post(), Hotel(), Profile()];
    var _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(
          milliseconds: 300,
        ),
        animationCurve: Curves.bounceInOut,
        index: 0,
        color: Colors.pink,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            // if(index ==0){
            //   ServerCallings.gerPosts();
            //   // ServerCallings.gerNewsfeedPosts()  ;
            // }
            _page = index;
          });
        },
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.bus_alert, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.hotel_rounded, size: 30),
          Icon(Icons.menu, size: 30),
        ],
      ),
      body: pages[_page],
    );
  }
}

