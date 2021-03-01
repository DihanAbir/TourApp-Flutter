
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_p32929/models/Bus.dart';
import 'package:flutter_p32929/widgets/CustomeRaiseButton.dart';
import 'package:flutter_p32929/widgets/CustomeTextFiled.dart';
import 'package:http/http.dart' as http;

class CreateService extends StatefulWidget {
  @override
  _CreateServiceState createState() => _CreateServiceState();
}

class _CreateServiceState extends State<CreateService> {
  TextEditingController text1 = TextEditingController();

  TextEditingController text2 = TextEditingController();

  TextEditingController text3 = TextEditingController();

  TextEditingController text4 = TextEditingController();

  Future<Bus> createUser(String servide_Name, String type, String license,
      String location, String image) async {
    final String apiUrl = "http://192.168.0.9:5000/products";

    final response = await http.post(apiUrl, body: {
      "servide_Name": servide_Name,
      "license": license,
      "location": location,
      "image": image,
    }).then((value) {
      // print("post : ${value.body.toString()} }");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CreateService")),
      body: Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        CustomeTextField.getTextField(text1, "servide_Name", "Enter Your servide_Name"),
        CustomeTextField.getTextField(
            text2, "license", "describe Your journey"),
        CustomeTextField.getTextField(
            text3, "location", "Enter Your Location"),
        CustomeTextField.getTextField(
            text4, "photoUrl", "Enter Your photoUrl"),


//           ToggleButtons(
//   children: <Widget>[
//     Icon(Icons.ac_unit),
//     Icon(Icons.call),
//     Icon(Icons.cake),
//   ],
//   onPressed: (int index) {
//     setState(() {
//       for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
//         if (buttonIndex == index) {
//           isSelected[buttonIndex] = true;
//         } else {
//           isSelected[buttonIndex] = false;
//         }
//       }
//     });
//   },
//   isSelected: isSelected,
// ),


        CustomeRaiseButton.getCustomeButton('Add Bus',

            // custome Function will be here
            () async {
          // NewsFeedServerCalling.getNewsFeedPosts();
          final String servide_Name = text1.text;
          final String license = text2.text;
          final String location = text3.text;
          final String image = text4.text;
          final String type = "Bus-Owner";


          final Bus bus =
              await createUser(servide_Name, type, license, location, image);
        }
        ),
      ],
    )
      ),
      
    );
  }
}