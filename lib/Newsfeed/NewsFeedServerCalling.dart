import "dart:convert";

import 'package:flutter_p32929/Newsfeed/NewsFeedStateManager.dart';
import 'package:flutter_p32929/models/UserPostModel.dart';
import 'package:flutter_p32929/widgets/Urls.dart';
import 'package:http/http.dart' as http;



class NewsFeedServerCalling {
  // postslider
  

    Future<List<UserPostModel>> getNewsFeedPosts() async {
    try {
      final response = await http.get(
        Url.newsfeed_endpoint,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (200 == response.statusCode) {
        final List<UserPostModel> userPostModel = userPostModelFromJson(response.body);
        // print(userPostModel);
        return userPostModel;
      } else {
        return List<UserPostModel>();
      }
    } catch (e) {
      return List<UserPostModel>();
    }
  }
  //   http.get(Url.newsfeed_endpoint).then((value) {
  //     Iterable l = json.decode(value.body);
  //     List<UserPostModel> userPostModel =
  //         List<UserPostModel>.from(l.map((model) => UserPostModel.fromJson(model)));
         
  //     NewsFeedStatesManager.newsfeed.setNewsfeedPost(userPostModel);
  //   });
  // }

}
