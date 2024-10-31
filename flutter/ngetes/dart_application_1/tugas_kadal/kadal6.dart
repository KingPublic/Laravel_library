import 'dart:io'; // Import library untuk input/output
import 'dart:math'; // Import library untuk operasi matematika acak
import 'flag.dart'; // Import file functions lu

// Set ukuran grid sesuai ukuran terminal dengan margin 3 dari border
int width = getScreenSize()[0] - 3; // Batas lebar grid
int height = getScreenSize()[1] - 3; // Batas tinggi grid

// Random posisi awal ular dengan minimal margin 3 dari border
int posAwalX = random(3, width); // Posisi X random di dalam grid
int posAwalY = random(3, height); // Posisi Y random di dalam grid

// Ular dimulai dengan panjang 5
List<Point<int>> snake = [
  Point(posAwalX, posAwalY), // Kepala ular
  Point(posAwalX - 1, posAwalY), // Badan pertama
  Point(posAwalX - 2, posAwalY), // Badan kedua
  Point(posAwalX - 3, posAwalY), // Badan ketiga
  Point(posAwalX - 4, posAwalY) // Ekor
];

// Random posisi makanan dengan minimal margin 3 dari border
Point<int> food =
    Point(random(3, width), random(3, height)); // Posisi makanan random

// Variabel untuk menyimpan arah terakhir ular
Point<int> lastDirection = Point(1, 0); // Arah awal ular bergerak ke kanan

void main() async {
  stdin.echoMode = false; // Nonaktifkan echo input
  stdin.lineMode = false; // Nonaktifkan line-mode input

  // Loop utama game
  while (true) {
    width = getScreenSize()[0] - 3; // Batas lebar grid
    height = getScreenSize()[1] - 3; // Batas tinggi grid
    autoMoveSnake(); // Pindahin ular tiap frame
    drawGrid(); // Gambar ulang grid di terminal
    await delay(100); // Delay 100ms tiap frame biar keliatan gerakannya
    if(snake.length > 50) break;
  }
  printFlag();
}

// Fungsi untuk menggerakkan ular otomatis menuju makanan
void autoMoveSnake() {
  final head = snake.first; // Ambil posisi kepala ular

  // Cari langkah selanjutnya dengan pathfinding menuju makanan
  Point<int>? nextMove = findNextMove(head, food);

  if (nextMove != null) {
    // Kalau ada langkah valid
    snake.insert(0, nextMove); // Tambah kepala ular ke arah nextMove
    lastDirection =
        Point(nextMove.x - head.x, nextMove.y - head.y); // Simpan arah gerak

    if (nextMove == food) {
      // Kalau nextMove ketemu makanan
      placeFood(); // Taruh makanan di lokasi baru
    } else {
      snake.removeLast(); // Kalau gak makan, hapus ekor (gerak ular)
    }
  }
}

// Pathfinding dengan logika anti muter balik
Point<int>? findNextMove(Point<int> start, Point<int> target) {
  List<Point<int>> directions = [
    Point(0, 1), // Gerak ke bawah
    Point(1, 0), // Gerak ke kanan
    Point(0, -1), // Gerak ke atas
    Point(-1, 0) // Gerak ke kiri
  ];

  // Prioritasin langkah yang gak berlawanan arah dulu
  directions
      .removeWhere((dir) => dir == Point(-lastDirection.x, -lastDirection.y));

  Point<int>? bestMove; // Variabel untuk nyimpen langkah terbaik
  int shortestDist = 9999; // Inisialisasi jarak terpendek (dummy besar)

  // Cari langkah terbaik yang bukan balik arah
  for (var direction in directions) {
    Point<int> newPos = Point(
        start.x + direction.x, start.y + direction.y); // Hitung posisi baru

    // Cek apakah posisi baru valid (tidak keluar grid)
    if (newPos.x >= 0 &&
        newPos.x < width &&
        newPos.y >= 0 &&
        newPos.y < height &&
        !snake.contains(newPos)) {
      int dist = (newPos.x - target.x).abs() +
          (newPos.y - target.y).abs(); // Hitung jarak ke target
      if (dist < shortestDist) {
        // Kalau jaraknya lebih pendek
        shortestDist = dist; // Simpan jarak baru
        bestMove = newPos; // Simpan langkah terbaik
      }
    }
  }

  // Kalau gak nemu jalan lain, paksa balik arah
  if (bestMove == null) {
    Point<int> fallbackMove = Point(start.x - lastDirection.x,
        start.y - lastDirection.y); // Langkah balik arah
    if (fallbackMove.x >= 0 &&
        fallbackMove.x < width &&
        fallbackMove.y >= 0 &&
        fallbackMove.y < height) {
      bestMove = fallbackMove; // Balik arah kalau buntu
    }
  }

  return bestMove; // Kembalikan langkah terbaik
}

// Render grid di terminal
void drawGrid() async {
  clearScreen(); // Hapus layar terminal

  int i = 1; // Inisialisasi counter buat render tubuh ular
  int posisiX = 0; // Variabel untuk menyimpan posisi X sebelumnya
  int posisiY = 0; // Variabel untuk menyimpan posisi Y sebelumnya

  // Render tubuh ular
  for (var s in snake) {
    moveTo(s.y + 1, s.x + 1); // Pindah kursor ke posisi ular

    if (i == 2 || i == snake.length - 1) {
      // Kalau bagian tubuh pertama atau terakhir
      stdout.write('O'); // Render kaki
      // Render kaki vertikal atau horizontal tergantung arah ular
      if (posisiX != s.x) {
        moveTo(s.y + 2, s.x + 1);
        stdout.write('O');
        moveTo(s.y + 3, s.x + 1);
        stdout.write('O');
        moveTo(s.y, s.x + 1);
        stdout.write('O');
        moveTo(s.y - 1, s.x + 1);
        stdout.write('O');
      } else {
        if (posisiY < s.y) {
          moveTo(s.y + 1, s.x + 2);
          stdout.write('O');
          moveTo(s.y + 1, s.x + 3);
          stdout.write('O');
          moveTo(s.y + 1, s.x);
          stdout.write('O');
          moveTo(s.y + 1, s.x - 1);
          stdout.write('O');
        } else {
          moveTo(s.y + 1, s.x + 2);
          stdout.write('O');
          moveTo(s.y + 1, s.x + 3);
          stdout.write('O');
          moveTo(s.y + 1, s.x);
          stdout.write('O');
          moveTo(s.y + 1, s.x - 1);
          stdout.write('O');
        }
      }
    } else {
      stdout.write('O'); // Render bagian tubuh biasa
    }
    posisiX = s.x; // Simpan posisi X saat ini
    posisiY = s.y; // Simpan posisi Y saat ini
    i++; // Increment counter
  }

  // Render kepala ular
  moveTo(snake.first.y + 1, snake.first.x + 1); // Pindah kursor ke kepala ular
  stdout.write('H'); // Render kepala ular

  // Render makanan
  moveTo(food.y + 1, food.x + 1); // Pindah kursor ke posisi makanan
  stdout.write('X'); // Render makanan
}

// Fungsi buat taruh makanan di posisi random
void placeFood() {
  food = Point(random(3, width),
      random(3, height)); // Random lokasi makanan di dalam grid
  while (snake.contains(food)) {
    // Cek kalau makanan muncul di badan ular
    food =
        Point(random(3, width), random(3, height)); // Re-random lokasi makanan
  }
}