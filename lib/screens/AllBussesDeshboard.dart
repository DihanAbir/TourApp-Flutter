import 'package:flutter/material.dart';
import 'package:flutter_p32929/logics/BusServerCalling.dart';
import 'package:flutter_p32929/logics/BusStateManager.dart';
import 'package:flutter_p32929/logics/StatesManager.dart';
import 'package:flutter_p32929/models/Bus.dart';
import 'package:flutter_p32929/models/BusStatesHolder.dart';
import 'package:flutter_p32929/models/Product.dart';
import 'package:flutter_p32929/screens/BusDetails.dart';
import 'package:flutter_p32929/widgets/CreateService.dart';
import 'package:flutter_p32929/widgets/DeleteView.dart';
import 'package:flutter_p32929/widgets/ServiceModify.dart';
import 'package:http/http.dart' as http;

class BusDeshboard extends StatefulWidget {
  @override
  _BusDeshboardState createState() => _BusDeshboardState();

  static fromJson(model) {}
}

class _BusDeshboardState extends State<BusDeshboard> {
  Widget build(BuildContext context) {
    BusServerCalling.getBuses();
var message;
// server calling using future
    //     List<Bus> _bus;
    // bool _loading = false;
    // @override
    // void initState() {
    //   BusServerCalling().getBus().then((value) => {
    //         if (mounted)
    //           {
    //             setState(() {
    //               _bus = value;
    //               _loading = true;
    //               print(_bus.length);
    //             })
    //           }
    //       });
    //   super.initState();
    // }


    // dissmiss er code  

 Future<Bus> deleteUser(String id) async {
    final String apiUrl = "http://192.168.0.9:5000/products/" ;

    final response = await http.delete(apiUrl + id);
  }



    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 00.0),
              child: Column(
                children: [
                  // Action Button
                  Container(
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // Add your onPressed code here!
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateService() ));
                      },
                      label: Text('Add New'),
                      icon: Icon(Icons.add_to_photos),
                      backgroundColor: Colors.pink,
                    ),
                  ),
                       // Action Button

                      //  Builder

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: BusStatesManager.busStates.bus.length,
                      itemBuilder: (ctx, index) {
                        Bus bus = BusStatesManager.busStates.bus[index];
                        return Dismissible(
                          key: ValueKey(bus.id),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) { },
                          confirmDismiss: (direction) async {
                            final result = await showDialog(
                                context: context, builder: (_) => DeleteView());
                                  print(bus.id.runtimeType );
                                if(result){
                                  final deleteResult = await  deleteUser(bus.id);
                                  
                                  if(deleteResult  != null || deleteResult.id == bus.id){
                                     message = "Deleted Successfully";

                                  }

                                  else{
                                    message = "Error to deleted";
                                  }

                                  showDialog(context: context, builder: (_) => AlertDialog(
                                    title: Text("Done!"),
                                    content: Text(message),
                                    actions: [
                                      FlatButton(child: Text("ok"),onPressed: (){
                                        Navigator.of(context).pop();
                                      },)
                                    ]
                                  ) 
                                  );

                                  return deleteResult?.id ?? false ;

                                }

                            return result;
                          },
                          background: Container(
                              color: Colors.red[400],
                              padding: EdgeInsets.only(left: 16.0),
                              child: Align(
                                child: Icon(
                                  Icons.delete,
                                  size: 45.0,
                                  color: Colors.white,
                                ),
                                alignment: Alignment.centerLeft,
                              )),
                          child: Container(
                              child: Card(
                            color: Colors.white,
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 50.0,
                                      child: Row(
                                        children: [
                                          Image.network(bus.image),
                                          Text(
                                            "products.license",
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                  Column(children: [
                                    RaisedButton(
                                      onPressed: () {
                                        print("tapped Deleted");
                                      },
                                      child: Text('Delete'),
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        print("tapped Edit");
                                      },
                                      child: Text('Edit'),
                                    ),
                                  ])
                                ],
                              ),
                              onTap: () {
                                var name = bus;
                                Route route = MaterialPageRoute(
                                    builder: (context) => BusDetails(name));
                                Navigator.push(context, route);
                                print("tapped bus");
                              },
                            ),
                          )),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
