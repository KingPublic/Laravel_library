import 'dart:io';
import 'soal4.dart';

void main() {
  Library library = Library();

  while (true) {
    print('Pilih operasi:');
    print('1. Tambah buku');
    print('2. Hapus buku');
    print('3. Tampilkan buku');
    print('4. Keluar');

    int operasi = int.parse(stdin.readLineSync()!);

    switch (operasi) {
      case 1:
        library.addBook();
        break;
      case 2:
        library.removeBook();
        break;
      case 3:
        library.displayBooks();
        print('Jumlah buku: ${library.books.length}');
        break;
      case 4:
        print('Keluar...');
        return;
      default:
        print('Pilihan tidak valid!');
    }
  }
}