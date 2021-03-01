
// import "dart:convert";

// import 'package:flutter_p32929/logics/StatesManager.dart';
// import 'package:flutter_p32929/models/Product.dart';
// import 'package:flutter_p32929/models/UserPostModel.dart';
// import 'package:http/http.dart' as http;

// final String api_endpoint = "http://192.168.0.9:5000/";
// final String post_endpoint = api_endpoint + "products/";
// final String newsfeed_endpoint = api_endpoint + "posts/";



// class GetPostServerCalling{
//    static gerPosts() {
//     http.get(post_endpoint).then((value) {
//       Iterable l = json.decode(value.body);
//       List<Product> product =
//           List<Product>.from(l.map((model) => Product.fromJson(model)));
//          print("server calling post");
//         //  print(product);

//       StatesManager.states.setProduct(product);
//     });
//   }
// }