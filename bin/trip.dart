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