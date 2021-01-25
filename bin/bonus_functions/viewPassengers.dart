import 'dart:io';
import '../helper_functions/showAllTrips_byID.dart';
import '../trip_data.dart';

void viewPassengers() {
  showAllTrips_byID();
  bool again = true;
  var id;
  do {
    try {
      print(
          'please enter ID, Which Trip you want to  Show Passengers .... OR ... (*) for all? ');
      id = stdin.readLineSync();
      id == '*' ? id = '*' : id = int.parse(id);
      again = false;
    } catch (e) {
      print('!!! Enter Correct Data');
    }
  } while (again == true);
  if (id == '*') {
    double sumPassenger = 0.0;
    trips.forEach((element) {
      sumPassenger += element.passengerLimit;
      print(
          'passenger in Trip ${element.location} ==> ${element.passengerLimit}');
    });
    print('passenger in all Trip =============> $sumPassenger');
  } else if (id.runtimeType == int) {
    int i = 0;
    for (i; i < trips.length; i++) {
      if (trips[i].id == id) {
        print('passenger in Trip $id ==> ${trips[i].passengerLimit}');
        break;
      }
    }
  } else {
    print('Enter Correct ID or select all by (*) please ..!!!');
  }
}
