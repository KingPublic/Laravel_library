import 'dart:io';

void main() {
  var apel = 5000;
  var jeruk = 4000;
  String? input;

  do {
    print("Pilih Buah yang ingin dibeli :\n 1. Jeruk \n 2. Apel \n 3. Exit");
    input = stdin.readLineSync();

    // Menggunakan ternary untuk memilih antara jeruk, apel, atau keluar
    input == "1" || input == "2" 
      ? (() {
          var buah = input == "1" ? "Jeruk" : "Apel";
          var harga = input == "1" ? jeruk : apel;
          
          print("Berapa Kg dibeli:");
          String? inputan = stdin.readLineSync();
          int? jumlahKg = int.tryParse(inputan ?? '');

          jumlahKg != null
            ? print("Harga Beli $buah anda: $jumlahKg kg dikali $harga = ${jumlahKg * harga}")
            : print("Input tidak valid");
        })()
      : input == "3"
        ? print("Anda Keluar")
        : print("Pilihan tidak valid");

  } while (input != "3");
}
