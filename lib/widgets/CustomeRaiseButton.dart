import 'package:flutter/material.dart';

class CustomeRaiseButton {
  static getCustomeButton ( String text,  Function setFunction ){
      return Container(
                    padding:  EdgeInsets.only(left: 150.0, top: 40.0),
                    child:  RaisedButton(
                      child:  Text(text),
                      onPressed: setFunction,
                    ));
    }
}
