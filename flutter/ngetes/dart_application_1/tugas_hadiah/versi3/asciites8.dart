import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() async {
  stdout.write('\x1B[2J'); // Clear screen
  stdout.write('\x1B[?25l'); // Hide cursor

  // Get user input for fireworks count
  stdout.write('Masukkan berapa kali kembang api ditembakkan: ');
  String? input = stdin.readLineSync();
  int fireworkCount = int.tryParse(input ?? '0') ?? 0;

  // Choose between HBD ANO or HBD OCTA
  String message = await chooseMessage();

  await fireworksDisplay(fireworkCount); // Show fireworks
  await showMessage(message); // Show the selected message

  stdout.write('\x1B[?25h'); // Restore cursor
}

Future<void> fireworksDisplay(int fireworkCount) async {
  var colors = [
    '\x1B[32m', // Green
    '\x1B[34m', // Blue
    '\x1B[35m', // Magenta
    '\x1B[31m', // Red
    '\x1B[33m', // Yellow
  ];

  var bgColors = [
    '\x1B[42m', // Green
    '\x1B[44m', // Blue
    '\x1B[45m', // Magenta
    '\x1B[41m', // Red
    '\x1B[43m', // Yellow
  ];

  List<int> positions = [40, 50, 70, 130, 150]; // Defined positions for fireworks

  for (var i = 0; i < fireworkCount; i++) {
    var color = colors[Random().nextInt(colors.length)];
    var bgColor = bgColors[colors.indexOf(color)];

    // Firework position
    int centerX = (i == 0) ? 90 : positions[Random().nextInt(positions.length)];

    await drawFireworkArc(color, centerX);
    stdout.write(bgColor); // Set background color
    await Future.delayed(Duration(milliseconds: 600)); // Show background longer
    await showExplosion(color, centerX);
    stdout.write('\x1B[0m'); // Reset colors
    await Future.delayed(Duration(milliseconds: 500)); // Delay between explosions
  }
}

// Draw fireworks with an arc effect
Future<void> drawFireworkArc(String color, int centerX) async {
  var centerY = 10; // Y position for explosion

  for (var step = 0; step < 10; step++) {
    stdout.write('\x1B[2J'); // Clear screen
    int x = centerX + (sin(step * 0.5) * 10).toInt(); // Arc movement
    stdout.write('\x1B[${centerY - step};${x}H${color}*\x1B[0m'); // Firework moving up
    await Future.delayed(Duration(milliseconds: 100)); // Ascending speed
  }
}

Future<void> showExplosion(String color, int centerX) async {
  var centerY = 7; // Posisi Y untuk ledakan

  // Munculkan ledakan kembang api
  for (var step = 0; step < 10; step++) {
    stdout.write('\x1B[2J'); // Bersihkan layar

    // Mengatur warna teks untuk bintang ledakan
    stdout.write(color); // Set warna foreground

    int numPoints = 30; // Jumlah titik untuk membuat bentuk bulat
    double radius = step.toDouble(); // Radius untuk setiap langkah

    for (var i = 0; i < numPoints; i++) {
      // Menghitung sudut untuk setiap titik
      var angle = (2 * pi / numPoints) * i;

      // Menghitung posisi x dan y dengan jari-jari tetap
      var x = (centerX + radius * cos(angle)).toInt();
      var y = (centerY + radius * sin(angle)).toInt();

      // Gambar titik ledakan
      stdout.write('\x1B[${y};${x}H${color}*'); // Menggambar titik ledakan
    }

    await Future.delayed(Duration(milliseconds: 100)); // Kecepatan ledakan
  }

  // Reset latar belakang dan teks ke default
  stdout.write('\x1B[0m');
}

// Function to choose message
Future<String> chooseMessage() async {
  stdout.write('Pilih pesan (1 untuk HBD ANO, 2 untuk HBD OCTA): ');
  String? choice = stdin.readLineSync();
  
  if (choice == '1') {
    return 'HBD ANO';
  } else if (choice == '2') {
    return 'HBD OCTA';
  } else {
    stdout.write('Pilihan tidak valid, menggunakan default: HBD ANO\n');
    return 'HBD ANO'; // Default message
  }
}

Future<void> showMessage(String message) async {
  var terminalHeight = 20; // Terminal height
  var startPosition = terminalHeight - 6; // Start position for text

  for (var i = startPosition; i >= 0; i--) {
    stdout.write('\x1B[2J'); // Clear screen
    drawLargeText(message, i); // Show large text moving up
    await Future.delayed(Duration(milliseconds: 150 + (startPosition - i) * 10)); // Fade-in effect
  }
}

void drawLargeText(String message, int rowOffset) {
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
    'T': [
      'TTTTTT ',
      '  TT   ',
      '  TT   ',
      '  TT   ',
      '  TT   ',
    ],
    'C': [
      ' CCCCC ',
      'C     C',
      'C      ',
      'C     C',
      ' CCCCC ',
    ],
  };

  // Display each line of the large text
  for (var i = 0; i < 5; i++) {
    var line = '';
    for (var j = 0; j < message.length; j++) {
      var char = message[j];
      line += largeFont[char]?[i] ?? '       '; // Use spaces for unknown characters
      line += ' '; // Space between letters
    }
    stdout.write('\x1B[${rowOffset + i};35H$line'); // Position text
  }
}
