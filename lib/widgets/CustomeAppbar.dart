import 'package:flutter/material.dart';

class CustomeAppbar {
   static getAppbar(title ){
     return AppBar(
            title: Text(title, style: TextStyle(fontSize: 26),),
            backgroundColor: Colors.indigo,
          );
   }
}