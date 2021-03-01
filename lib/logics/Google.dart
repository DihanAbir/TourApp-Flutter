import 'package:flutter_p32929/logics/BusinessLogic.dart';
import 'package:flutter_p32929/logics/StatesHolder.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {
  static Future<void> handleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'profile',
      'email',
    ]);

    try {
      GoogleSignInAccount user = await _googleSignIn.signIn();

      GoogleSignInAccount currentUser = _googleSignIn.currentUser;

      // StateHolder.stateData.setUser(
      //     email: currentUser.email,
      //     photo: currentUser.photoUrl,
      //     name: currentUser.displayName);

      BusinessLogic().createUser(
        currentUser.email, currentUser.displayName, currentUser.photoUrl
      );
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
  }
}
