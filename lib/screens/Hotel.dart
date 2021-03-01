import 'package:flutter/material.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/Product.dart';
import 'package:flutter_p32929/screens/HotelDetails.dart';

class Hotel extends StatefulWidget {
  @override
  _HotelState createState() => _HotelState();

  static fromJson(model) {}
}

var sortedBus = Set();

class _HotelState extends State<Hotel> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          // children: [
          //   // ListView.builder(
          //       physics: NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       itemCount: StatesManager.states.products.length,
          //       itemBuilder: (ctx, index) {
          //         Product products = StatesManager.states.products[index];
          //         sortedBus.add(products.servideName);
          //         return Container(
          //             child: products.type == "Hotel-Owner"
          //                 ? Card(
          //                     color: Colors.white,
          //                     child: InkWell(
          //                       child: Padding(
          //                         padding: EdgeInsets.symmetric(
          //                             vertical: 24.0, horizontal: 16.0),
          //                         child: Container(
          //                             // height: 200.0,
          //                             width: double.infinity,
          //                             child: Column(
          //                               children: [
          //                                 Container(
          //                                   padding: EdgeInsets.fromLTRB(
          //                                       10, 20, 20, 20),
          //                                   child: Text(
          //                                     "products.servideName",
          //                                     style: TextStyle(
          //                                         fontSize: 30.0,
          //                                         color: Colors.teal,
          //                                         fontWeight: FontWeight.bold),
          //                                   ),
          //                                 ),
          //                                 ClipRRect(
          //                                   borderRadius:
          //                                       BorderRadius.circular(16.0),
          //                                   child: Image.network(
          //                                     products.image,
          //                                   ),
          //                                 )
          //                               ],
          //                             )),
          //                       ),
          //                       onTap: () {
          //                           var name = products;
          //                           Route route = MaterialPageRoute(
          //                               builder: (context) => HotelDetails(name));
          //                           Navigator.push(context, route);
          //                           print("tapped hotels");
          //                         },
          //                     ),
          //                   )
          //                 : null);
          //       }),
          // ],
        ),
      ),
    );
  }
}
