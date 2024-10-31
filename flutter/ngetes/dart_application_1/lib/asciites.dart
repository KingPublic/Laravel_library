import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() async {
  stdout.write('\x1B[2J'); // Membersihkan layar
  stdout.write('\x1B[?25l'); // Menyembunyikan cursor

  // Meminta input dari pengguna
  stdout.write('Masukkan berapa kali kembang api ditembakkan: ');
  String? input = stdin.readLineSync();
  int fireworkCount = int.tryParse(input ?? '0') ?? 0;

  await fireworksDisplay(fireworkCount); // Menentukan berapa kali kembang api ditembak
  await showHBD(); // Menampilkan teks "HBD ANO" setelah kembang api selesai

  stdout.write('\x1B[?25h'); // Mengembalikan cursor
}

Future<void> fireworksDisplay(int fireworkCount) async {
  var colors = [
    '\x1B[32m', // Hijau
    '\x1B[34m', // Biru
    '\x1B[35m', // Merah Muda
    '\x1B[31m', // Merah
    '\x1B[33m', // Kuning
  ];

  var bgColors = [
    '\x1B[42m', // Hijau
    '\x1B[44m', // Biru
    '\x1B[45m', // Merah Muda
    '\x1B[41m', // Merah
    '\x1B[43m', // Kuning
  ];

  for (var i = 0; i < fireworkCount; i++) {
    // Memilih warna untuk kembang api dan latar belakang
    var color = colors[Random().nextInt(colors.length)];
    var bgColor = bgColors[colors.indexOf(color)];

    // Mengatur posisi kembang api
    int centerX;
    if (i == 0) {
      centerX = 37; // Kembang api pertama di tengah (dari 80 kolom, posisi 37 lebih tepat)
    } else {
      centerX = Random().nextInt(80); // Kembang api selanjutnya di posisi acak
    }

    // Munculkan kembang api di posisi yang telah ditentukan
    await drawFirework(color, centerX);

    // Mengubah warna latar belakang
    stdout.write(bgColor); // Set warna latar belakang

    // Menampilkan ledakan kembang api
    await showExplosion(color, centerX);

    // Reset warna latar belakang dan teks ke default
    stdout.write('\x1B[0m');

    await Future.delayed(Duration(milliseconds: 500)); // Jeda antar ledakan
  }
}

Future<void> drawFirework(String color, int centerX) async {
  var centerY = 8; // Posisi Y untuk ledakan

  // Munculkan kembang api bergerak ke atas
  for (var step = 0; step < 10; step++) {
    stdout.write('\x1B[2J'); // Bersihkan layar

    // Menggambar posisi kembang api
    stdout.write('\x1B[${centerY - step};${centerX}H${color}*\x1B[0m'); // Kembang api bergerak ke atas

    await Future.delayed(Duration(milliseconds: 100)); // Kecepatan naik
  }
}

Future<void> showExplosion(String color, int centerX) async {
  var centerY = 10; // Posisi Y untuk ledakan

  // Munculkan ledakan kembang api
  for (var step = 0; step < 10; step++) {
    stdout.write('\x1B[2J'); // Bersihkan layar

    // Mengatur warna teks agar sama dengan warna kembang api
    stdout.write(color); // Set warna untuk ledakan

    for (var i = 0; i < 20; i++) {
      var angle = (2 * pi / 20) * i;
      var radius = step.toDouble();
      var x = (centerX + radius * cos(angle)).toInt();
      var y = (centerY + radius * sin(angle)).toInt();

      stdout.write('\x1B[${y};${x}H*'); // Gambar kembang api
    }

    await Future.delayed(Duration(milliseconds: 100)); // Kecepatan ledakan
  }

  // Reset latar belakang dan teks ke default
  stdout.write('\x1B[0m');
}

Future<void> showHBD() async {
  var message = 'HBD ANO';
  var terminalHeight = 20; // Tinggi terminal

  // Tampilkan teks dari bawah ke atas
  for (var i = terminalHeight; i >= 0; i--) {
    stdout.write('\x1B[2J'); // Bersihkan layar
    stdout.write('\x1B[${i};30H$message'); // Tampilkan teks pada posisi yang bergerak ke atas
    await Future.delayed(Duration(milliseconds: 200)); // Delay per frame
  }
}
