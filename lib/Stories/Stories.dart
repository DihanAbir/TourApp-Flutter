

// import 'package:flutter/material.dart';
// import 'package:flutter_p32929/Newsfeed/NewsFeedServerCalling.dart';
// import 'package:flutter_p32929/models/UserPostModel.dart';
// import 'package:video_player/video_player.dart';


// class Stories extends StatefulWidget {
//   Stories({Key key}) : super(key: key);

//   @override
//   _StoriesState createState() => _StoriesState();
// }

// class _StoriesState extends State<Stories> {



//     PageController _pageController ;
//     VideoPlayerController _videoPlayerController;
//     int _currentIndex = 0;


//  List<UserPostModel> _userPostModel;
//   bool _loading = false;
//   @override

  
//     @override
//     // void initState() { 
//     //   super.initState();
     
//     // }

//   void initState() {
//      _pageController = PageController();
//     _videoPlayerController = VideoPlayerController.network("imahgese")

//     ..initialize().then((value) => setState(( ) {}));
//     _videoPlayerController.play();

//     NewsFeedServerCalling().getNewsFeedPosts().then((value) => {
//           if (mounted)
//             {
//               setState(() {
//                 _userPostModel = value;
//                 _loading = true;
//                 // print(_userPostModel.length);
//               })
//             }
//         });
//     super.initState();
//   }








//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: PageView.builder(
//          controller:  _pageController,
//          itemCount: 5,
//          itemBuilder: (context, i){
//            final UserPostModel userPostModel = _userPostModel[i];
//            return Container(
//                                   height: 20.0,
//                                   width: 20,
//                                   child: Image.network(userPostModel.feelings),
//                                 );
//          }
//        ) ,
//     );
//   }
// }