import "dart:convert";
import 'package:flutter_p32929/logics/BusStateManager.dart';
import 'package:flutter_p32929/models/Bus.dart';
import 'package:flutter_p32929/widgets/Urls.dart';
import 'package:http/http.dart' as http;

class BusServerCalling {

  //   Future<List<Bus>> getBus() async {
  //   try {
  //     final response = await http.get(
  //       Url.bus_endpoint,
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //     );
  //     if (200 == response.statusCode) {
  //       final List<Bus> bus = busFromJson(response.body);
  //       print(bus);
  //       return bus;
  //     } else {
  //       return List<Bus>();
  //     }
  //   } catch (e) {
  //     return List<Bus>();
  //   }
  // }








  // postslider
  static getBuses() {
    http.get(Url.bus_endpoint).then((value) {
      Iterable l = json.decode(value.body);
      print("buses datas ${value.body}");

      List<Bus> bus = List<Bus>.from(l.map((model) => Bus.fromJson(model)));
      print("buses array ${bus}");
      BusStatesManager.busStates.setBus(bus);

      // print("buses::  $bus");
    });
  }




  //DeleteBus
      Future<List<Bus>> deleteBuses() async {
    try {
      final response = await http.get(
        Url.bus_endpoint+ '/id/' ,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (200 == response.statusCode) {
        final List<Bus> bus = busFromJson(response.body);
        print(bus);
        return bus;
      } else {
        return List<Bus>();
      }
    } catch (e) {
      return List<Bus>();
    }
  }




  // static deleteBuses(String id ) {
  //   http.put(Url.bus_endpoint+ '/id/' ).then((value) {
  //     Iterable l = json.decode(value.body);
  //     print("buses datas ${value.body}");

  //     List<Bus> bus = List<Bus>.from(l.map((model) => Bus.fromJson(model)));
  //     print("buses array ${bus}");
  //     BusStatesManager.busStates.setBus(bus);

  //     // print("buses::  $bus");
  //   });
  // }
}
