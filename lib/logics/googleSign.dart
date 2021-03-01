import 'package:flutter_p32929/models/User.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInLogic {
  static Future<dynamic> handleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'profile',
      'email',
    ]);

    // ServerCallings().login();
    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();
      User u = new User(name: user.displayName, email: user.email);
      String str = u.toJson();
      print("str nme aded ${u.name}  str");
      // http.post(body: str)
    } catch (error) {
      print(error);
    }
  }

  static Future<void> handleSignOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'profile',
      'email',
    ]);

    _googleSignIn.disconnect();
    // loginInfo =null;
  }
}
