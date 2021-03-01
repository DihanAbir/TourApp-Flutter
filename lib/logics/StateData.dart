
import 'package:flutter_p32929/models/OAuthAccessToken.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class User {
  String photo;
  String email;
  String name;
  String phoneNumber;
}

class StateData extends StatesRebuilder {
  OAuthAccessToken currentToken;
  setToken( OAuthAccessToken currentToken) {
    this.currentToken = currentToken;
    rebuildStates();
  }
}
