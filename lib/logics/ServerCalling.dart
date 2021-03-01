import "dart:convert";
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/Product.dart';
import 'package:flutter_p32929/models/User.dart';
import 'package:flutter_p32929/screens/Bus.dart';
import 'package:flutter_p32929/widgets/Urls.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';


class ServerCallings {
  

    Future<List<Product>> getProduct() async {
    try {
      final response = await http.get(
        Url.sponsored_endpoint,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (200 == response.statusCode) {
        final List<Product> product = productFromJson(response.body);
        // print(userPostModel);
        return product;
      } else {
        return List<Product>();
      }
    } catch (e) {
      return List<Product>();
    }
  }




// // login 
// void login (){
//    Future<User> login(List<String> scopes) async {
//     List<String> scopes = [];



    
//   // GoogleSignIn _googleSignIn = GoogleSignIn();
//   // var user = _googleSignIn.signIn();
//   // print(user.displayName  ) ;

//    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: scopes);
//     GoogleSignInAccount user = await _googleSignIn.signIn();
//     User u = new User(name: user.displayName, email: user.email);
// }
// }








  // postslider
  // static gerPosts() {
  //   http.get( Url.sponsored_endpoint ).then((value) {
  //     Iterable l = json.decode(value.body);
  //     List<Product> product =
  //         List<Product>.from(l.map((model) => Product.fromJson(model)));

  //     StatesManager.states.setProduct(product);
      
  //   });
  // }


  
}
