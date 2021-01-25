import '../trip_data.dart';

void latestTrips() {
  try {
    for (int i = trips.length - 1; i > trips.length - 11; i--) {
      print(trips[i]);
    }
  } catch (e) {
    print('Trips less than 10 !!!!! ');
  }
}