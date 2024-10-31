import 'dart:io';

void main() {
  while (true) {
    // Meminta input suhu dalam Celsius atau keluar jika input 'exit'
    stdout.write("Masukkan suhu dalam Celsius (atau ketik 'exit' untuk keluar): ");
    String? input = stdin.readLineSync();

    // Mengecek apakah input adalah 'exit'
    if (input != null && input.toLowerCase() == 'exit') {
      print("Program dihentikan.");
      break;
    }

    try {
      // Mengonversi input ke angka
      double celsius = double.parse(input!);
      
      // Mengonversi Celsius ke Fahrenheit
      double fahrenheit = (9 / 5) * celsius + 32;

      // Menampilkan hasil konversi
      print("Suhu dalam Fahrenheit adalah: ${fahrenheit.toStringAsFixed(2)}\n");
    } catch (e) {
      // Menangani input yang bukan angka
      print("Masukkan angka yang valid atau ketik 'exit' untuk keluar.\n");
    }
  }
}
