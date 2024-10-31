import 'dart:io';

void main() {
  const double gajiPokok = 4000000; // Gaji pokok
  const double bonus = 200000; // Bonus jika bekerja lebih dari 40 jam

  print("Masukkan jumlah jam kerja per minggu:");
  
  String? input = stdin.readLineSync();
  double? jamKerja = double.tryParse(input ?? '');

  // Menggunakan satu if untuk validasi input
  jamKerja != null 
    ? print("Total gaji untuk $jamKerja jam kerja per minggu adalah: Rp ${gajiPokok + (jamKerja > 40 ? bonus : 0)}")
    : print("Input tidak valid, mohon masukkan angka.");
}
