import '../trip_data.dart';

void showAllTrips_byID() {
  print('!!!!  This all Trips ===> ');
  trips.sort((a, b) => a.id.compareTo(b.id));
  trips.forEach((element) {
    print(element.toString());
  });
  print('');
}