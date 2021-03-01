import 'package:flutter_p32929/models/Bus.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class BusStatesHolders extends StatesRebuilder {

  List<Bus>bus = [];

// widgets
  setBus(List<Bus>bus ) {
    this.bus = bus;
    rebuildStates();
  }

}
