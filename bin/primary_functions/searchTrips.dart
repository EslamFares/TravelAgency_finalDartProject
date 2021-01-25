import 'dart:io';

import '../trip_data.dart';

void searchTrips() {
  bool agin = true;
  double price;
  bool found = false;
  do {
    try {
      print('please enter Price? ');
      price = double.parse(stdin.readLineSync());
      agin = false;
    } catch (e) {
      print('!!! Enter Correct Data');
    }
  } while (agin == true);

  int i = 0;
  for (i; i < trips.length; i++) {
    if (trips[i].price == price) {
      print(trips[i].showPiceFirst());
      found = true;
      break;
    }
  }
  found
      ? print('===> We found Travel pice equal price which you enter.')
      : print("===> Sorry We don't found any Travel price equal your price !!");
}