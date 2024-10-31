import 'dart:io';

void main() {
  // Meminta input jumlah jam parkir
  stdout.write("Masukkan jumlah jam parkir: ");
  String? input = stdin.readLineSync();

  try {
    // Mengonversi input ke angka
    int jamParkir = int.parse(input!);

    // Inisialisasi variabel untuk biaya parkir
    int totalBiaya;

    // Menghitung biaya parkir
    if (jamParkir <= 2) {
      totalBiaya = jamParkir * 2000; // Rp 2.000 per jam untuk 2 jam pertama
    } else {
      totalBiaya = 2 * 2000 + (jamParkir - 2) * 1000; // Rp 1.000 untuk jam berikutnya
    }

    // Menampilkan hasil biaya parkir
    print("Total biaya parkir: Rp $totalBiaya");

  } catch (e) {
    // Menangani input yang bukan angka
    print("Masukkan jumlah jam parkir yang valid. ");
  }
}
