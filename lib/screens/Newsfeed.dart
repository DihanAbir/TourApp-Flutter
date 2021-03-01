import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p32929/logics/LoginController.dart';
import 'package:flutter_p32929/widgets/CustomStory.dart';
import 'package:flutter_p32929/widgets/CustomeAppbar.dart';
import 'package:flutter_p32929/widgets/CustomeImageSlider.dart';
import 'package:flutter_p32929/widgets/CustomePost.dart';
import 'package:flutter_p32929/widgets/TopDestinatio.dart';
import 'package:get/get.dart';

class Newsfeed extends StatefulWidget {
  const Newsfeed({Key key}) : super(key: key);

  @override
  _NewsfeedState createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  final loginController = Get.put(LoginController());




  @override
  Widget build(BuildContext context) {
      // var  _currentUser = loginController.currentUser;;
    // NewsfeedServerCallings.gerNewsfeedPosts();
    return MaterialApp(
      home: Scaffold(
        appBar: CustomeAppbar.getAppbar(
          'NewFeed',
        ),
        body: SingleChildScrollView(
          physics:ScrollPhysics(),
          child: Column(children: [
            CustomeImageSlider(),
            CustomeStory(),
            DestinationCarousel(),
            Text("des car"),
            // Text({"Name: ${_currentUser?.displayName}"});
            CustomePost(),
          ]),
        ),

        // body: CustomePost(),
      ),
    );
    
  }
}
