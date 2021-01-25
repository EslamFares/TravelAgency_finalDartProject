import '../helper_functions/acceptPrameterFromUser.dart';
import '../trip.dart';
import '../trip_data.dart';

void addTrip() {
  print('!!!! You Will Add Trip Please ,Enter this data:===> ');

  var new_Trip = acceptPrameterFromUser();
  trips.add(new_Trip);

  print('!!!! all Trips with new Trips ===> ');
  trips.sort((a, b) => a.id.compareTo(b.id));
  trips.forEach((element) {
    print(element.toString());
  });
}