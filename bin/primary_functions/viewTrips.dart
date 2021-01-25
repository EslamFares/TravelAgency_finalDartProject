import '../helper_functions/dateConverter.dart';
import '../trip_data.dart';

void viewTrips() {
  print('View all Trips Ordered By Date');
  trips.sort((a, b) => dateConverter(a.date).compareTo(dateConverter(b.date)));

  trips.forEach((element) {
    print(element.showDateFirst());
  });
}