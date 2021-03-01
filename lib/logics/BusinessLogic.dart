import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/OAuthAccessToken.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class BusinessLogic {
  Future<http.Response> createUser(email, name, photo) async {
    final String apiLogin = "http://192.168.0.9:5000/users/login/";

    final response = await http.post(apiLogin,
        headers: {'Content-Type': 'application/json; charset=UTF-8 '},
        body: JSON.jsonEncode(<String, String>{
          'email': email,
          'name': name,
          'photo': photo,
        }));

    print(response.body);
    OAuthAccessToken token  = OAuthAccessToken.fromJson(response.body.toString());
    

    // Map<String, dynamic> user = JSON.jsonDecode(response.body);
    // StatesManager.setToken(user['access_token']);
    // print(user['access_token']);
  }
}
