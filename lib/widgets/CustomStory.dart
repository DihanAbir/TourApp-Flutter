import 'package:flutter/material.dart';
import 'package:flutter_p32929/Newsfeed/NewsFeedServerCalling.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/UserPostModel.dart';
import 'package:flutter_p32929/screens/PostDetails.dart';
import 'package:flutter_p32929/widgets/Shimmar.dart';
import 'package:flutter_p32929/models/Product.dart';
import 'package:flutter_p32929/widgets/StoreShowcase.dart';

class CustomeStory extends StatefulWidget {
  @override
  _CustomeStoryState createState() => _CustomeStoryState();
}

class _CustomeStoryState extends State<CustomeStory> {
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
                // print(_userPostModel.length);
              })
            }
        });
    super.initState();
  }

  List arr = [
    '12',
    '15',
    '2',
    '4',
    '45',
    '2',
    '12',
    '15',
    '2',
    '4',
    '45',
    '2',
    '12',
    '15',
    '2',
    '4',
    '45',
    '2'
  ];

  Widget build(BuildContext context) {
    return _userPostModel?.length== null ? Shimmar() :   Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 100.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RaisedButton(
                      onPressed: () => {
                       print("clickes")
                      },
                      child: CircleAvatar(
                        // backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(Icons.add),
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _userPostModel.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          child: Column(
                            children: [
                              // CircleAvatar(
                              //   backgroundColor: Colors.white,
                              //   radius: 30,
                              // ),

                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  "${_userPostModel[index].photoUrl}",
                                ),
                              ),
                            ],
                          ),
                          onTap: () async {
                            var name = _userPostModel[index];
                            await showDialog(
                                context: context,
                                builder: (_) => StoryShowcase(name));

                            // var name = _userPostModel[index];
                            //     Route route = MaterialPageRoute(
                            //         builder: (context) => StoryShowcase(name));
                            //     Navigator.push(context, route);
                            //     print("tapped");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

// ),
        ],
      ),
    );
  }
}
