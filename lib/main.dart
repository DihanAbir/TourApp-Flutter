import 'package:flutter/material.dart';
import 'package:flutter_p32929/Newsfeed/NewsFeedServerCalling.dart';
import 'package:flutter_p32929/logics/ServerCalling.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/routes/MainRoute.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

// B3:5E:DC:8E:AC:9B:DD:8E:F8:8F:00:C5:E0:24:B3:AF:59:3A:C2:53

void main() {
  // NewsFeedServerCalling.getNewsFeedPosts();
  // ServerCallings.gerPosts();
  runApp(StartingPoint());

  //  ServerCallings.gerPosts();
}

class StartingPoint extends StatefulWidget {
  @override
  _StartingPointState createState() => _StartingPointState();
}

class _StartingPointState extends State<StartingPoint> {
  //   NewsFeedServerCalling.getNewsFeedPosts();
  // ServerCallings.gerPosts();

  @override
  void initState() {
    // NewsFeedServerCalling.getNewsFeedPosts();
    // ServerCallings.gerPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      models: [StatesManager.states ],
      builder: (statesBuilderContext, rm) {
        return MainRoute.getDefaultLayout();
      },
    );
  }
}
