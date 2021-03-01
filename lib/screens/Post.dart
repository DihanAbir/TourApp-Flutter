import 'package:flutter/material.dart';
import 'package:flutter_p32929/widgets/CustomStory.dart';
import 'package:flutter_p32929/widgets/CustomeForm.dart';
import 'package:flutter_p32929/widgets/CustomeAppbar.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomeAppbar.getAppbar('Post'),
        body: Column(children: [
          MyCustomForm(),
          // CustomeStory(),

        ],)
      ),
    );
  }
}
