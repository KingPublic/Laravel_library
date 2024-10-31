import 'dart:io';
import 'soal6.dart';

void main() {
  print('Temperature Conversion Program');
  print('---------------------------');

  print('Enter the temperature in Celsius:');
  double celsius = double.parse(stdin.readLineSync()!);

  Suhu suhu = Suhu(celsius: celsius);

  print('Choose the conversion option:');
  print('1. Reaumur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  print('4. All conversions');

  int option = int.parse(stdin.readLineSync()!);

  switch (option) {
    case 1:
      print('Reaumur conversion:');
      print('${suhu.celsius}°C is equal to ${suhu.toReaumur()}°Ré');
      break;
    case 2:
      print('Fahrenheit conversion:');
      print('${suhu.celsius}°C is equal to ${suhu.toFahrenheit()}°F');
      break;
    case 3:
      print('Kelvin conversion:');
      print('${suhu.celsius}°C is equal to ${suhu.toKelvin()} K');
      break;
    case 4:
      print('All conversions:');
      print('${suhu.celsius}°C is equal to ${suhu.toReaumur()}°Ré');
      print('${suhu.celsius}°C is equal to ${suhu.toFahrenheit()}°F');
      print('${suhu.celsius}°C is equal to ${suhu.toKelvin()} K');
      break;
    default:
      print('Invalid option. Please choose a valid option.');
  }
}