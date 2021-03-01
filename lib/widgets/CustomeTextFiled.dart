import 'package:flutter/material.dart';


class CustomeTextField {
  static getTextField ( TextEditingController controller,  String labelText, String hintText ){
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 20.0),
      child: Container(
          width: 500,
          child: TextFormField(
                  controller : controller,
                  decoration:  InputDecoration(
                    hintText: hintText,
                    labelText: labelText,
                  ),
                ),
        ),
    );
  } 

}