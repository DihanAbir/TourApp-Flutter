import 'package:flutter/material.dart';
import 'package:flutter_p32929/logics/Globalvariable.dart';
import 'package:flutter_p32929/logics/Google.dart';
import 'package:flutter_p32929/logics/LoginController.dart';
import 'package:flutter_p32929/logics/ServerCalling.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/logics/googleSign.dart';
import 'package:flutter_p32929/models/User.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  'profile',
  'email',
]);

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}


// var loginfo ;


class _SignInScreenState extends State<SignInScreen> {

  GoogleSignInAccount _currentUser;
  
    // List<User> _usermode;

  @override
  void initState() {
    super.initState();
    StatesManager.getToken().then((value) {
      setState(() {
        Globalvariable.acesstoken = value;
      });
    }
    );
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {


      
        // loginController.currentUser = account;
        // _currentUser = loginController.currentUser;
        // LoginController.currentUser = account ;
        _currentUser = account;
        // print("user info ${_currentUser.email}");
      });
    });
    _googleSignIn.signInSilently();

  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildBody());
    
    // print(loginController.currentUser);
  }
    // print(usermode);

  Widget _buildBody() {
    if (_currentUser != null) {
      // loginfo = _currentUser;
      return GetMaterialApp(
               home: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: GoogleUserCircleAvatar(
                identity: _currentUser,
              ),
              title: Text(_currentUser?.displayName ?? ''),
              subtitle: Text(Globalvariable.acesstoken),
              
            ),
            RaisedButton(
              onPressed:   _handleSignOut,
              child: Text('SIGN OUT1'),
            )
          ],
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text('You are not signed in..'),
          RaisedButton(
            onPressed:  (){Google.handleSignIn();}    ,
            child: Text('SIGN IN New'),
          )
        ],
      );
    }
  }



//   Future<void> _handleSignIn() async {
//     // ServerCallings().login();
//     try {
//       GoogleSignInAccount user = await _googleSignIn.signIn();
//       User u = new User(name: user.displayName, email: user.email);
//       String str = u.toJson();
//       print("str nme aded ${u.name}  str");
//       // http.post(body: str)
//     } catch (error) {
//       print(error);
//     }
//   }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
    // loginInfo =null;
  }
}
