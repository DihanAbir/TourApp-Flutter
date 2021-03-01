import 'package:flutter/material.dart';

class StoryShowcase extends StatefulWidget {
  // StoryShowcase({Key key}) : super(key: key);

  var details;
  StoryShowcase(this.details);


  @override
  _StoryShowcaseState createState() => _StoryShowcaseState(this.details);
}

class _StoryShowcaseState extends State<StoryShowcase> {

    var details;
  _StoryShowcaseState(this.details);

  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(

        width: 400,
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(this.details.photoUrl),
                // fit: BoxFit.cover
            )
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
      
    //   ),
    //   body: Container(child: Image.network(this.details.photoUrl) ,),
    // );
  }
}