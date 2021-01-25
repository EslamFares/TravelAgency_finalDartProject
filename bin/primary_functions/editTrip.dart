import 'dart:io';
import '../helper_functions/acceptPrameterFromUser.dart';
import '../helper_functions/showAllTrips_byID.dart';
import '../trip_data.dart';

void editTrip() {
  showAllTrips_byID();
  print('please enter ID, Which Trip you want to change? ');
  var id = int.parse(stdin.readLineSync());
  bool edit = false;
  int i = 0;
  for (i; i < trips.length; i++) {
    if (trips[i].id == id) {
      print(trips[i].toString());
      edit = true;
      break;
    }
  }
  if (edit) {
    print('!!!! Enter new data');
    var editData = acceptPrameterFromUser();

    trips[i].id = editData.id;
    trips[i].location = editData.location;
    trips[i].passengerLimit = editData.passengerLimit;
    trips[i].date = editData.date;
    trips[i].price = editData.price;

    print('# This new Data');
    print(trips[i]);
  } else {
    print('input ID to edit Wrong');
  }
}