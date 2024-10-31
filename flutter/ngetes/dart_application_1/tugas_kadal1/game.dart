import 'dart:io'; // Mengimpor pustaka untuk input/output
import 'dart:math'; // Mengimpor pustaka untuk operasi matematika acak
import 'score.dart'; // Mengimpor fungsi dari file flag.dart

// Mendapatkan ukuran grid sesuai ukuran terminal dengan margin 3 dari border
int gridWidth = getScreenSize()[0] - 3; // Lebar grid
int gridHeight = getScreenSize()[1] - 3; // Tinggi grid

// Mengatur posisi awal ular secara acak dengan margin minimal 3 dari border
int startX = random(3, gridWidth); // Posisi X acak di dalam grid
int startY = random(3, gridHeight); // Posisi Y acak di dalam grid

// Ular dimulai dengan panjang 5
List<Point<int>> snakeBody = [
  Point(startX, startY), // Kepala ular
  Point(startX - 1, startY), // Bagian pertama tubuh
  Point(startX - 2, startY), // Bagian kedua tubuh
  Point(startX - 3, startY), // Bagian ketiga tubuh
  Point(startX - 4, startY)  // Ekor
];

// Mengatur posisi makanan secara acak dengan margin minimal 3 dari border
Point<int> foodPosition = Point(random(3, gridWidth), random(3, gridHeight)); // Posisi makanan acak

// Variabel untuk menyimpan arah terakhir ular bergerak
Point<int> previousDirection = Point(1, 0); // Arah awal ular bergerak ke kanan

void main() async {
  stdin.echoMode = false; // Nonaktifkan echo input
  stdin.lineMode = false; // Nonaktifkan mode baris input

  // Loop utama permainan
  while (true) {
    gridWidth = getScreenSize()[0] - 3; // Perbarui batas lebar grid
    gridHeight = getScreenSize()[1] - 3; // Perbarui batas tinggi grid
    moveSnakeAutomatically(); // Gerakkan ular setiap frame
    renderGrid(); // Gambar ulang grid di terminal
    await delay(100); // Delay 100ms per frame untuk memperlihatkan gerakan
    if (snakeBody.length > 50) break; // Hentikan jika panjang ular lebih dari 50
  }
  printFlag(); // Tampilkan pesan setelah permainan selesai
}

// Fungsi untuk menggerakkan ular secara otomatis menuju makanan
void moveSnakeAutomatically() {
  final headPosition = snakeBody.first; // Ambil posisi kepala ular

  // Tentukan langkah berikutnya dengan pathfinding menuju makanan
  Point<int>? nextStep = determineNextStep(headPosition, foodPosition);

  if (nextStep != null) {
    // Jika ada langkah yang valid
    snakeBody.insert(0, nextStep); // Tambah kepala ular ke arah nextStep
    previousDirection = Point(nextStep.x - headPosition.x, nextStep.y - headPosition.y); // Simpan arah gerak

    if (nextStep == foodPosition) {
      // Jika nextStep bertemu makanan
      spawnFood(); // Tempatkan makanan di lokasi baru
    } else {
      snakeBody.removeLast(); // Jika tidak makan, hapus ekor (gerak ular)
    }
  }
}

Point<int>? determineNextStep(Point<int> start, Point<int> target) {
  List<Point<int>> possibleDirections = [
    Point(0, 1), // Gerak ke bawah
    Point(1, 0), // Gerak ke kanan
    Point(0, -1), // Gerak ke atas
    Point(-1, 0) // Gerak ke kiri
  ];

  // Hapus langkah yang berlawanan arah
  possibleDirections.removeWhere((dir) => dir == Point(-previousDirection.x, -previousDirection.y));

  Point<int>? optimalMove; // Variabel untuk menyimpan langkah terbaik
  int minDistance = 9999; // Menggunakan nilai besar daripada infinity

  // Cari langkah terbaik yang bukan berbalik arah
  for (var direction in possibleDirections) {
    Point<int> newPosition = Point(start.x + direction.x, start.y + direction.y); // Hitung posisi baru

    // Cek apakah posisi baru valid (tidak keluar dari grid)
    if (newPosition.x >= 0 &&
        newPosition.x < gridWidth &&
        newPosition.y >= 0 &&
        newPosition.y < gridHeight &&
        !snakeBody.contains(newPosition)) {
      int distance = (newPosition.x - target.x).abs() + (newPosition.y - target.y).abs(); // Hitung jarak ke target
      if (distance < minDistance) {
        // Jika jarak lebih pendek
        minDistance = distance; // Simpan jarak baru
        optimalMove = newPosition; // Simpan langkah terbaik
      }
    }
  }

  // Jika tidak ada langkah lain, paksa untuk berbalik arah
  if (optimalMove == null) {
    Point<int> reverseMove = Point(start.x - previousDirection.x, start.y - previousDirection.y); // Langkah berbalik arah
    if (reverseMove.x >= 0 && reverseMove.x < gridWidth && reverseMove.y >= 0 && reverseMove.y < gridHeight) {
      optimalMove = reverseMove; // Balik arah jika tidak ada pilihan lain
    }
  }

  return optimalMove; // Kembalikan langkah terbaik
}


// Menggambar grid di terminal
void renderGrid() async {
  clearScreen(); // Bersihkan layar terminal

  int segmentCounter = 1; // Inisialisasi counter untuk menggambar tubuh ular
  int previousX = 0; // Variabel untuk menyimpan posisi X sebelumnya
  int previousY = 0; // Variabel untuk menyimpan posisi Y sebelumnya

  // Menggambar tubuh ular
  for (var segment in snakeBody) {
    moveTo(segment.y + 1, segment.x + 1); // Pindah kursor ke posisi ular

    if (segmentCounter == 2 || segmentCounter == snakeBody.length - 1) {
      // Jika bagian tubuh pertama atau terakhir
      stdout.write('*'); // Gambar bagian kaki
      // Gambar bagian kaki vertikal atau horizontal tergantung arah ular
      if (previousX != segment.x) {
        moveTo(segment.y + 2, segment.x + 1);
        stdout.write('*');
        moveTo(segment.y + 3, segment.x + 1);
        stdout.write('*');
        moveTo(segment.y, segment.x + 1);
        stdout.write('*');
        moveTo(segment.y - 1, segment.x + 1);
        stdout.write('*');
      } else {
        if (previousY < segment.y) {
          moveTo(segment.y + 1, segment.x + 2);
          stdout.write('*');
          moveTo(segment.y + 1, segment.x + 3);
          stdout.write('*');
          moveTo(segment.y + 1, segment.x);
          stdout.write('*');
          moveTo(segment.y + 1, segment.x - 1);
          stdout.write('*');
        } else {
          moveTo(segment.y + 1, segment.x + 2);
          stdout.write('*');
          moveTo(segment.y + 1, segment.x + 3);
          stdout.write('*');
          moveTo(segment.y + 1, segment.x);
          stdout.write('*');
          moveTo(segment.y + 1, segment.x - 1);
          stdout.write('*');
        }
      }
    } else {
      stdout.write('*'); // Gambar bagian tubuh biasa
    }
    previousX = segment.x; // Simpan posisi X saat ini
    previousY = segment.y; // Simpan posisi Y saat ini
    segmentCounter++; // Increment counter
  }

  // Gambar kepala ular
  moveTo(snakeBody.first.y + 1, snakeBody.first.x + 1); // Pindah kursor ke kepala ular
  stdout.write('0'); // Gambar kepala ular

  // Gambar makanan
  moveTo(foodPosition.y + 1, foodPosition.x + 1); // Pindah kursor ke posisi makanan
  stdout.write('🍎'); // Gambar makanan
}

// Fungsi untuk menempatkan makanan di posisi acak
void spawnFood() {
  foodPosition = Point(random(3, gridWidth), random(3, gridHeight)); // Lokasi makanan acak di dalam grid
  while (snakeBody.contains(foodPosition)) {
    // Cek jika makanan muncul di tubuh ular
    foodPosition = Point(random(3, gridWidth), random(3, gridHeight)); // Random ulang lokasi makanan
  }
}
