import 'dart:io';
import '../trip.dart';

Trip acceptPrameterFromUser() {
  bool again = true;
  do {
    try {
      print('Edit ID :');
      int id = int.parse(stdin.readLineSync());
      print('Edit location :');
      String location = stdin.readLineSync();
      print('Edit  passengerLimit :');
      int passengerLimit = int.parse(stdin.readLineSync());
      print('Edit  date : in this format (25-10-2020)  =>');
      String date = stdin.readLineSync();
      print('Edit  price :');
      double price = double.parse(stdin.readLineSync());
      again = false;
      return Trip(id, location, passengerLimit, date, price);
    } catch (e) {
      print('Error!!! Please Enter Correct Data');
    }
  } while (again == true);
}