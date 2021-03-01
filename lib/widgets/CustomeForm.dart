// Create a Form widget.
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p32929/Newsfeed/NewsFeedServerCalling.dart';
import 'package:flutter_p32929/models/UserPostModel.dart';
import 'package:flutter_p32929/widgets/CustomeRaiseButton.dart';
import 'package:flutter_p32929/widgets/CustomeTextFiled.dart';
import 'package:http/http.dart' as http;

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

// all controllers
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();

  Future<UserPostModel> createPost(String feelings, String description,
      String location, String photoUrl) async {
    final String apiUrl = "http://192.168.0.9:5000/posts";

    final response = await http.post(apiUrl, body: {
      // 'user':'id'
      "feelings": feelings,
      "description": description,
      "location": location,
      "photoUrl": photoUrl,
    }).then((value) {
      // print("post : ${value.body.toString()} }");
    });
  }

  @override
  void initState() {
    super.initState();
    var allServices;
    var singleServices = {};
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomeTextField.getTextField(text1, "feeling", "Enter Your Feeling"),
        CustomeTextField.getTextField(
            text2, "description", "describe Your journey"),
        CustomeTextField.getTextField(
            text3, "location", "Enter Your Location"),
        CustomeTextField.getTextField(
            text4, "photoUrl", "Enter Your photoUrl"),
        CustomeRaiseButton.getCustomeButton('Post',

            // custome Function will be here
            () async {
          // NewsFeedServerCalling.getNewsFeedPosts();
          final String feelings = text1.text;
          final String description = text2.text;
          final String location = text3.text;
          final String photoUrl = text4.text;

          final UserPostModel posts =
              await createPost(feelings, description, location, photoUrl);
        }
        ),
      ],
    );
  }
}
