import 'dart:io';
import '../bonus_functions/discount.dart';
import '../helper_functions/showAllTrips_byID.dart';
import '../trip_data.dart';

void reverse() {
  showAllTrips_byID();
  bool agin = true;
  int id;
  do {
    try {
      print('Which Trip you want to Reserve ? please enter ID ... ');
      id = int.parse(stdin.readLineSync());
      agin = false;
    } catch (e) {
      print('!!! Enter Correct Data');
    }
  } while (agin == true);
  bool reserve = false;
  int i = 0;
  for (i; i < trips.length; i++) {
    if (trips[i].id == id) {
      print(trips[i].showPassengerFirst());
      reserve = true;
      break;
    }
  }
  if (reserve) {
    if (trips[i].passengerLimit < 300) {
      trips[i].passengerLimit = trips[i].passengerLimit + 1;
      print('# Congratulations, you reserve the Travel');
      print(trips[i].showPassengerFirst());

      trips[i].price = discount(trips[i]);
    } else {
      print('# Sorry Travel is Complet');
    }
  } else {
    print('input ID Wrong !! not found');
  }
}