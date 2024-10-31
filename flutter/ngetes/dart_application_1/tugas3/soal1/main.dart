import 'dart:io';
import 'soal1.dart';

void main() {
  print('Masukkan jumlah siswa:');
  int jumlahSiswa = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlahSiswa; i++) {
    print('Masukkan nama siswa ${i + 1}:');
    String nama = stdin.readLineSync()!;
    print('Masukkan NIM siswa ${i + 1}:');
    int nim = int.parse(stdin.readLineSync()!);
    print('Masukkan nilai siswa ${i + 1}:');
    int nilai = int.parse(stdin.readLineSync()!);

    Siswa siswa = Siswa(nama: nama, nim: nim, nilai: nilai);
    siswa.tampilkanInfoSiswa();
    print('Telah lulus: ${siswa.telahLulus()}');
  }
}