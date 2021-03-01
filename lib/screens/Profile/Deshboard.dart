import 'package:flutter/material.dart';
import 'package:flutter_p32929/screens/AllBussesDeshboard.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton(
            onPressed: () {
                        Route route = MaterialPageRoute(builder: (context) => BusDeshboard()   );
                        Navigator.push(context, route);
                      print("tapped bus");
                    },
            child: Text('All Buses'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('All Hotels'),
          )
        ])
      ],
    );
  }
}
