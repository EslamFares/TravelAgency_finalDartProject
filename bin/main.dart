import 'dart:io';
import 'package:intl/intl.dart';

void main(List<String> arguments) {
  var agin = true;
  int funNum;

  allFunNames();

  do {
    try {
      print('Enter num to choose funcation ... ');
      funNum = int.parse(stdin.readLineSync());
      if (funNum < 9) agin = false;
    } catch (e) {
      print('!!! Enter Correct Data');
    }
  } while (agin == true);

  executeFun(funNum);
}

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

void allFunNames() {
  print('This is all Funcation ...');
  print('1  ===> Add Trip() ');
  print('2  ===> Edit Trip() ');
  print('3  ===> Delete Trip() ');
  print('4  ===> Vew Trip() ');
  print('5  ===> Search Trip() ');
  print('6  ===> Reverse () ');
  print('7  ===> Latest Trip() ');
  print('8  ===> View Passenger() ');
}

//=========================================================
void viewPassengers() {
  showAllTrips();
  bool agin = true;
  var id;
  do {
    try {
      print(
          'please enter ID, Which Trip you want to  Show Passengers .... OR ... (*) for all? ');
      id = stdin.readLineSync();
      id == '*' ? id = '*' : id = int.parse(id);
      agin = false;
    } catch (e) {
      print('!!! Enter Correct Data');
    }
  } while (agin == true);
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

void latestTrips() {
  try {
    for (int i = trips.length - 1; i > trips.length - 11; i--) {
      print(trips[i]);
    }
  } catch (e) {
    print('Trips less than 10 !!!!! ');
  }
}

double discount(Trip trip) {
  if (trip.price > 10000) {
    print('#Congratulations, you have  discount to this  flight');
    double newPrice = (trip.price - trip.price * (20 / 100));
    print('Price become ==> ${newPrice}');
    return newPrice;
  } else {
    return trip.price;
  }
}

//==========================================================
void reverse() {
  showAllTrips();
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

void viewTrips() {
  print('View all Trips Ordered By Date');
  trips.sort((a, b) => dateConverter(a.date).compareTo(dateConverter(b.date)));

  trips.forEach((element) {
    print(element.showDateFirst());
  });
}

void deleteTrip() {
  showAllTrips();

  bool agin = true;
  int id;
  do {
    try {
      print('please enter ID, Which Trip you want to  Delect? ');
      id = int.parse(stdin.readLineSync());
      agin = false;
    } catch (e) {
      print('!!! Enter Correct Data');
    }
  } while (agin == true);
  bool del = false;
  int i = 0;
  for (i; i < trips.length; i++) {
    if (trips[i].id == id) {
      print('${trips[i].toString()} xxxx> will delete X ');
      del = true;
      break;
    }
  }
  if (del) {
    trips.removeAt(i);
    print('# New Data');
    trips.forEach((element) {
      print(element.toString());
    });
  } else {
    print('input ID to edit Wrong');
  }
}

void editTrip() {
  showAllTrips();
  print('please enter ID, Which Trip you want to change? ');
  int id = int.parse(stdin.readLineSync());
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

void addTrip() {
  print('!!!! You Will Add Trip Please ,Enter this data:===> ');

  trips.add(acceptPrameterFromUser());

  print('!!!! all Trips with new Trips ===> ');
  trips.sort((a, b) => a.id.compareTo(b.id));
  trips.forEach((element) {
    print(element.toString());
  });
}
//=============================================================

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
      print('Edit  date :');
      String date = stdin.readLineSync();
      print('Edit  price :');
      double price = double.parse(stdin.readLineSync());
      again = false;
      return Trip(id, location, passengerLimit, date, price);
    } catch (e) {
      print('Error!!! Please Enter Corecct Data');
    }
  } while (again == true);
}

void showAllTrips() {
  print('!!!!  This all Trips ===> ');
  trips.sort((a, b) => a.id.compareTo(b.id));
  trips.forEach((element) {
    print(element.toString());
  });
  print('');
}

DateTime dateConverter(String date) {
  final format = DateFormat("dd-MM-yyyy");
  DateTime gettingDate = format.parse(date);
  final DateFormat newFormatter = DateFormat('yyyy-MM-dd');
  final String formatted = newFormatter.format(gettingDate);
  return DateTime.parse(formatted);
}

//=============================================================
List<Trip> trips = [
  Trip(1, 'Alex', 30, '10-10-2021', 1550.5),
  Trip(2, 'Cairo', 150, '15-5-2021', 2000.5),
  Trip(3, 'Aswan', 200, '25-3-2021', 1000.0),
  Trip(4, 'Dahab', 297, '2-2-2021', 6550.5),
  Trip(5, 'Inda', 250, '12-11-2021', 10000.5),
  Trip(6, 'NewYour', 300, '13-1-2021', 15000.0),
  Trip(7, 'London', 299, '25-3-2021', 15654.5),
  Trip(8, 'Paris', 300, '15-7-2021', 145852.5),
  Trip(9, 'China', 205, '15-6-2021', 243546.5),
  Trip(10, 'Rusha', 270, '12-8-2021', 23416.5),
  Trip(11, 'Doubi', 300, '3-9-2021', 50000.5),
  Trip(55, 'Kanda', 200, '1-12-2021', 90000.5),
];

//======================================

class Trip {
  int id;
  String location;
  int passengerLimit;
  String date;
  double price;
  Trip(this.id, this.location, this.passengerLimit, this.date, this.price);

  @override
  String toString() {
    return 'id: $id - location: $location - passengerLimit: $passengerLimit - date: $date - price: $price';
  }

  String showDateFirst() {
    return 'Date: $date - location: $location - passengerLimit: $passengerLimit - price: $price - id: $id ';
  }

  String showPiceFirst() {
    return ' price: $price - location: $location - Date: $date -  passengerLimit: $passengerLimit -  id: $id ';
  }

  String showPassengerFirst() {
    return 'passengerLimit: $passengerLimit -  price: $price - location: $location - Date: $date -  id: $id ';
  }
}
