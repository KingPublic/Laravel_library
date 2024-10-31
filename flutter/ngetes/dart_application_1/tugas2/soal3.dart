import 'dart:io';
import 'dart:math'; // Untuk menggunakan fungsi pow dan lainnya

void main() {
  const double pi = 3.141592653589793; // Nilai pi mendekati
  print("Masukkan diameter lingkaran:");
  
  String? input = stdin.readLineSync();
  double? diameter = double.tryParse(input ?? '');

  if (diameter != null) {
    double radius = diameter / 2;
    double luas = pi * pow(radius, 2); // Rumus luas lingkaran: π * r^2
    
    print("Luas lingkaran dengan diameter $diameter adalah: $luas");
  } else {
    print("Input tidak valid, mohon masukkan angka.");
  }
}
