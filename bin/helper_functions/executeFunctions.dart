import '../bonus_functions/latestTrips.dart';
import '../bonus_functions/viewPassengers.dart';
import '../primary_functions/addTrip.dart';
import '../primary_functions/deleteTrip.dart';
import '../primary_functions/editTrip.dart';
import '../primary_functions/reverse.dart';
import '../primary_functions/searchTrips.dart';
import '../primary_functions/viewTrips.dart';

void executeFun(int funNum) {
  switch (funNum) {
    case 1:
      {
        print('\nThe function to be executed ===> addTrip()\n');
        addTrip();
      }
      break;
    case 2:
      {
        print('\nThe function to be executed ===> editTrip()\n');
        editTrip();
      }
      break;
    case 3:
      {
        print('\nThe function to be executed ===> deleteTrip()\n');
        deleteTrip();
      }
      break;
    case 4:
      {
        print('\nThe function to be executed ===> viewTrips()\n');
        viewTrips();
      }
      break;
    case 5:
      {
        print('\nThe function to be executed ===> searchTrips()\n');
        searchTrips();
      }
      break;
    case 6:
      {
        print('\nThe function to be executed ===> reverse()\n');
        reverse();
      }
      break;
    case 7:
      {
        print('\nThe function to be executed ===> latestTrips()\n');
        latestTrips();
      }
      break;
    case 8:
      {
        print('\nThe function to be executed ===> viewPassengers()\n');
        viewPassengers();
      }
      break;
    default:
      print('\nError in value entered\n');
      break;
  }
}
