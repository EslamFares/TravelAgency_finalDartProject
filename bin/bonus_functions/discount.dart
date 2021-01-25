import '../trip.dart';

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