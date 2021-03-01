import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  // PostDetails({Key key}) : super(key: key);
  var name;
  PostDetails(this.name);

  @override
  _PostDetailsState createState() => _PostDetailsState(this.name);
}

class _PostDetailsState extends State<PostDetails> {
  var title;
  _PostDetailsState(this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;
    // final BusTitle = routeArgs['feelings'];
    // final BusId = routeArgs['id'];

    print(routeArgs);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title.feelings),
      ),
      body: Container(
        // width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text("Post details page ${this.title.views} "),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                child: Text(
                  this.title.description,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  this.title.photoUrl,
                  height: 450,
                  width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
              Text(
                "Reviews: ${this.title.views} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.teal[200],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.location} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.brown[200],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.feelings} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.views} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.deepOrange ,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.id} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.reviesModel} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.views} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.views} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
