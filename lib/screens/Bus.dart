import 'package:flutter/material.dart';
import 'package:flutter_p32929/logics/BusServerCalling.dart';
import 'package:flutter_p32929/logics/ServerCalling.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/Product.dart';
import 'package:flutter_p32929/screens/BusDetails.dart';
import 'package:flutter_p32929/widgets/Shimmar.dart';

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();

  static fromJson(model) {}
}

class _BusState extends State<Bus> {
  List data;
  // List unFilteredData ;
// List<Product> products
  List<Product> unFilteredData = List<Product>();

  List<Product> _products = List<Product>();
  String type = 'Bus-Owner';
  bool _loading = false;
  @override
  void initState() {
    ServerCallings().getProduct().then((value) => {
          if (mounted)
            {
              setState(() {
                _products = value;
                unFilteredData = _products;
                // _loading = true;
              })
            }
        });
    super.initState();
  }


  Widget build(BuildContext context) {

    @override
    void initState() {
      super.initState();
    }

    return _products?.length == null
        ? Shimmar()
        : Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Search Bus"),
                    onChanged: (str) {
                      str = str.toLowerCase();
                      setState(() {
                        unFilteredData = _products.where((searchItem) {
                          var location = searchItem.price.toString().toLowerCase();
                          return location.contains(str);
                        }).toList();
                      });
                      //  this.searchData(str);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 00.0),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: unFilteredData.length,
                        itemBuilder: (ctx, index) {
                          Product products = unFilteredData[index];
                          return Container(
                              // padding: EdgeInsets.only(bottom: 26.0),
                              child: Card(
                            color: Colors.white,
                            child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.0, horizontal: 16.0),
                                child: Container(
                                    // height: 500.0,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 50, 20, 20),
                                          child: Text(
                                            products.views,
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Image.network(products.image),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                products.price,
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.indigo,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                products.price,
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                products.price,
                                                style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ])
                                        //    FittedBox(
                                        //   child: Image.network(products.image),
                                        //   fit: BoxFit.fill,
                                        // )
                                      ],
                                    )),
                              ),
                              onTap: () {
                                var name = products;
                                Route route = MaterialPageRoute(
                                    builder: (context) => BusDetails(name));
                                Navigator.push(context, route);
                                // print("tapped bus");
                              },
                            ),
                          ));
                        }),
                  ),
                ],
              ),
            ),
          );
  }
}
