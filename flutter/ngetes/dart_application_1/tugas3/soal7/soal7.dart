// vehicle.dart
class Vehicle {
  String _name;
  double _speed;

  Vehicle({required String name, required double speed})
      : _name = name,
        _speed = speed;

  String get name => _name;
  set name(String value) => _name = value;

  double get speed => _speed;
  set speed(double value) => _speed = value;

  void move() {
    print('$_name is moving at $_speed km/h');
  }
}

class Car extends Vehicle {
  Car({required String name, required double speed})
      : super(name: name, speed: speed);

  @override
  void move() {
    if (speed < 30) {
      print('The $_name car moves slow through traffic at $_speed km/h');
    } else if (speed > 60) {
      print('The $_name car moves fast through traffic at $_speed km/h');
    } else {
      print('The $_name car moves at a moderate speed through traffic at $_speed km/h');
    }
  }
}

class Bike extends Vehicle {
  Bike({required String name, required double speed})
      : super(name: name, speed: speed);

  @override
  void move() {
    if (speed < 30) {
      print('The $_name bike moves slow through traffic at $_speed km/h');
    } else if (speed > 60) {
      print('The $_name bike moves fast through traffic at $_speed km/h');
    } else {
      print('The $_name bike moves at a moderate speed through traffic at $_speed km/h');
    }
  }
}