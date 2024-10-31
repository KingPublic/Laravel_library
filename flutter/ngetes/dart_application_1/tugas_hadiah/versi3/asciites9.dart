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

  // Daftar posisi untuk kembang api kedua dan seterusnya
  List<int> positions = [40, 50, 70, 130, 150]; // Posisi yang sudah ditentukan

  for (var i = 0; i < fireworkCount; i++) {
    // Memilih warna untuk kembang api dan latar belakang
    var color = colors[Random().nextInt(colors.length)];
    var bgColor = bgColors[colors.indexOf(color)];

      // Mengatur posisi kembang api
      int centerX;
      if (i == 0) {
        centerX = 90; // Kembang api pertama di tengah paling kanan (kolom 90)
      } else {
        // Menggunakan posisi dari daftar yang sudah ditentukan
        centerX = positions[Random().nextInt(positions.length)];
      }

    // Munculkan kembang api di posisi yang telah ditentukan
    await drawFirework(color, centerX);

    // Mengubah warna latar belakang
    stdout.write(bgColor); // Set warna latar belakang

    // **Menampilkan warna background lebih lama setelah ledakan selesai**
    await Future.delayed(Duration(milliseconds: 400)); // Ini memperpanjang tampilan background saja

    // Menampilkan ledakan kembang api dengan warna bintang sesuai kembang api
    await showExplosion(color, centerX);

    // Reset warna latar belakang dan teks ke default
    stdout.write('\x1B[0m');

    await Future.delayed(Duration(milliseconds: 500)); // Jeda antar ledakan
  }
}

Future<void> drawFirework(String color, int centerX) async {
  var centerY = 10; // Posisi Y untuk ledakan

  // Munculkan kembang api bergerak ke atas
  for (var step = 0; step < 10; step++) {
    stdout.write('\x1B[2J'); // Bersihkan layar

    // Menggambar posisi kembang api
    stdout.write('\x1B[${centerY - step};${centerX}H${color}*\x1B[0m'); // Kembang api bergerak ke atas

    await Future.delayed(Duration(milliseconds: 100)); // Kecepatan naik
  }
}

Future<void> showExplosion(String color, int centerX) async {
  var centerY = 7; // Posisi Y untuk ledakan

  // Munculkan ledakan kembang api
  for (var step = 0; step < 10; step++) {
    stdout.write('\x1B[2J'); // Bersihkan layar

    // Mengatur warna teks untuk bintang ledakan
    stdout.write(color); // Set warna foreground

    for (var i = 0; i < 40; i++) {
      var angle = (2 * pi / 40) * i;
      var radius = step.toDouble() + Random().nextDouble() * 2; // Variasi jari-jari
      var x = (centerX + radius * cos(angle)).toInt();
      var y = (centerY + radius * sin(angle)).toInt();

      // Gambar ledakan dengan variasi karakter untuk efek
      var explosionChar = (Random().nextBool()) ? '*' : '.'; // Variasi antara '*' dan '.'
      stdout.write('\x1B[${y};${x}H${color}${explosionChar}\x1B[0m'); // Warna foreground dan karakter
    }

    await Future.delayed(Duration(milliseconds: 100)); // Kecepatan ledakan
  }

  // Reset latar belakang dan teks ke default
  stdout.write('\x1B[0m');
}


Future<void> showHBD() async {
  var message = 'HBD ANO';
  var terminalHeight = 20; // Tinggi terminal
  var startPosition = terminalHeight - 6; // Posisi awal untuk teks

  var colors = [
    '\x1B[32m', // Hijau
    '\x1B[34m', // Biru
    '\x1B[35m', // Merah Muda
    '\x1B[31m', // Merah
    '\x1B[33m', // Kuning
  ];

  // Tampilkan teks dari bawah ke atas
  for (var i = startPosition; i >= 0; i--) {
    stdout.write('\x1B[2J'); // Bersihkan layar
    drawLargeText(message, i, colors); // Tampilkan teks besar pada posisi yang bergerak ke atas
    await Future.delayed(Duration(milliseconds: 200)); // Delay per frame
  }
}

void drawLargeText(String message, int rowOffset, List<String> colors) {
  var largeFont = {
    'H': [
      'HH   HH',
      'HH   HH',
      'HHHHHHH',
      'HH   HH',
      'HH   HH',
    ],
    'B': [
      'BBBBBB ',
      'BB   BB',
      'BBBBBB ',
      'BB   BB',
      'BBBBBB ',
    ],
    'D': [
      'DDDDDD ',
      'DD   DD',
      'DD   DD',
      'DD   DD',
      'DDDDDD ',
    ],
    ' ': [
      '       ',
      '       ',
      '       ',
      '       ',
      '       ',
    ],
    'A': [
      '  AA   ',
      ' A  A  ',
      'AAAAAA ',
      'A    A ',
      'A    A ',
    ],
    'N': [
      'NN   N ',
      'N N  N ',
      'N  N N ',
      'N   NN ',
      'N    N ',
    ],
    'O': [
      ' OOOOO ',
      'O     O',
      'O     O',
      'O     O',
      ' OOOOO ',
    ],
  };

  // Menyimpan baris teks yang ditampilkan
  for (var i = 0; i < 5; i++) {
    var line = '';
    for (var j = 0; j < message.length; j++) {
      var char = message[j];
      line += largeFont[char]?[i] ?? '       '; // Jika karakter tidak ada, gunakan spasi
      line += ' '; // Menambahkan spasi setelah setiap huruf
    }

    // Pilih warna untuk setiap karakter
    String color = colors[i % colors.length]; // Menggunakan warna berdasarkan urutan
    stdout.write('\x1B[${rowOffset + i};35H${color}$line\x1B[0m'); // Tampilkan baris dengan penempatan lebih ke tengah
  }
}