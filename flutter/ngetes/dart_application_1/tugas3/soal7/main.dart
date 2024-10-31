import 'dart:io';
import 'soal7.dart';


void main() {
  print('Do you want to create a Car or Bike?');
  print('1. Car');
  print('2. Bike');

  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    print('Enter the name of the car:');
    String namaMobil = stdin.readLineSync()!;
    print('Enter the speed of the car:');
    double Cepetga = double.parse(stdin.readLineSync()!);

    Car car = Car(name: namaMobil, speed: Cepetga);
    car.move();
    print('Name: ${car.name}');
    print('Speed: ${car.speed}');
  } else if (choice == 2) {
    print('Enter the name of the bike:');
    String namaSepeda = stdin.readLineSync()!;
    print('Enter the speed of the bike:');
    double kencangga = double.parse(stdin.readLineSync()!);

    Bike bike = Bike(name: namaSepeda, speed: kencangga);
    bike.move();
    print('Name: ${bike.name}');
    print('Speed: ${bike.speed}');
  } else {
    print('Invalid choice. Please choose a valid option.');
  }
}