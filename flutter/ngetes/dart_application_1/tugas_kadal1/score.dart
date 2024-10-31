// flag.dart
import 'dart:math';
import 'dart:io';
// Fungsi untuk membersihkan layar
void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // Bersihkan seluruh layar, gerakkan kursor ke 0;0
}

// Fungsi untuk memberikan delay
Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

// Fungsi untuk menghasilkan angka acak dalam rentang tertentu
int random(int min, int max) {
  return min + (Random().nextInt(max - min) as int); // Mengembalikan angka acak dalam rentang min dan max
}

// Fungsi untuk menghasilkan angka acak hingga nilai maksimum
int randomMax(int max) {
  return Random().nextInt(max); // Mengembalikan angka acak hingga nilai maksimum
}

// Fungsi untuk mendapatkan ukuran terminal
getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines]; // Mengembalikan ukuran kolom dan baris terminal
}

// Fungsi untuk memindahkan kursor ke posisi tertentu
void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H'); // Pindah kursor ke baris dan kolom yang ditentukan
}

// Fungsi untuk menampilkan pesan ketika permainan selesai
void printFlag() {
  clearScreen(); // Bersihkan layar
  moveTo(0, 0); // Gerakkan kursor ke posisi 0,0
  print("Selamat! Anda telah mencapai bendera!"); // Tampilkan pesan
  delay(2000); // Tunggu 2 detik
  print("Skor Anda: ${getScore()}"); // Tampilkan skor
  delay(1000); // Tunggu 1 detik
  print("Terima kasih telah bermain!"); // Tampilkan pesan
}

// Fungsi untuk mendapatkan skor
int getScore() {
  // Implementasi untuk mendapatkan skor
  // Contoh: return 100;
  return 0; // Skor default
}

// Fungsi untuk menampilkan pesan game over
void printGameOver() {
  clearScreen(); // Bersihkan layar
  moveTo(0, 0); // Gerakkan kursor ke posisi 0,0
  print("Game Over! Anda kalah."); // Tampilkan pesan
  delay(2000); // Tunggu 2 detik
  print("Skor Anda: ${getScore()}"); // Tampilkan skor
  delay(1000); // Tunggu 1 detik
  print("Terima kasih telah bermain!"); // Tampilkan pesan
}