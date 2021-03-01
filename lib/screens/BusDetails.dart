import 'package:flutter/material.dart';

class BusDetails extends StatefulWidget {
  // BusDetails({Key key}) : super(key: key);
  var name;
  BusDetails(this.name);

  @override
  _BusDetailsState createState() => _BusDetailsState(this.name);
}

class _BusDetailsState extends State<BusDetails> {
  var title;
  _BusDetailsState(this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;
    // final BusTitle = routeArgs['feelings'];
    // final BusId = routeArgs['id'];

    print(routeArgs);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title.price),
      ),
      body: Container(
        // width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text("Post details page ${this.title.id} "),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                child: Text(
                  this.title.id,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  this.title.image,
                  height: 450,
                  width: double.infinity,
                  // fit: BoxFit.cover,
                ),
              ),
              Text(
                "Reviews: ${this.title.id} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.teal[200],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.price} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.brown[200],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Reviews: ${this.title.price} ",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
