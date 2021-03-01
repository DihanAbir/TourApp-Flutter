import 'package:flutter/material.dart';
import 'package:flutter_p32929/Newsfeed/NewsFeedServerCalling.dart';
import 'package:flutter_p32929/models/UserPostModel.dart';
import 'package:flutter_p32929/screens/PostDetails.dart';
import 'package:flutter_p32929/widgets/Shimmar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class CustomePost extends StatefulWidget {
  @override
  _CustomePostState createState() => _CustomePostState();
}

class _CustomePostState extends State<CustomePost> {
  TextEditingController text1 = TextEditingController();

  List<UserPostModel> _userPostModel;
  bool _loading = false;
  @override
  void initState() {
 
     NewsFeedServerCalling().getNewsFeedPosts().then((value) => {
          if (mounted)
            {
              setState(() {
                _userPostModel = value;
                _loading = true;
              })
            }
        });   

   
    super.initState();
  }

  Widget build(BuildContext context) {
    return _userPostModel?.length == null   
        ? Shimmar()
        : Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _userPostModel.length,
                itemBuilder: (ctx, i) {
                  UserPostModel userPost = _userPostModel[i];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 26.0),
                      child: Card(
                        child: InkWell(
                          // color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 500.0,
                                  width: double.infinity,
                                  child: Image.network(userPost.photoUrl),
                                ),
                                Text(
                                  userPost.description,
                                  style: TextStyle(
                                    backgroundColor: Colors.grey[300],
                                    fontSize: 30.0,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  "Feelings: ${userPost.feelings}",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  "Location: ${userPost.location}",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  "Location: ${userPost.reviesModel}",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () async {
                            Future<UserPostModel> createUser(
                                String views) async {
                              final String apiUrl =
                                  "http://192.168.0.9:5000/posts/${views}";

                              final response = await http.put(apiUrl, body: {
                                "views": (views + '1').toString(),
                              }).then((value) {
                                // print("post : ${value.body.toString()} }") ;
                              });
                            }

                            var name = userPost;
                            Route route = MaterialPageRoute(
                                builder: (context) => PostDetails(name));
                            Navigator.push(context, route);
                            print("tapped post?");

                            final String views = userPost.id;

                            final UserPostModel posts = await createUser(views);
                          },
                        ),
                      ));
                }),
          );
  }
}
