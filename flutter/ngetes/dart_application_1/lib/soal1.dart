// soal1.dart
import 'dart:io';  // Import this for stdout.write

void printPyramid(List<int> angka) {
  int rows = angka.length;
  int i = 0;  // Row counter

  while (i < rows) {
    String line = "";

    // This for loop manages both spaces and numbers
    for (int j = 0; j < (rows + i); j++) {
      // Add spaces for centering the pyramid or numbers
      line += (j < rows - i - 1) 
        ? " "   // Add leading spaces
        : "${angka[(j - (rows - i - 1)) % angka.length]}" +
          ((j < rows + i - 1) ? " " : "");  // Add space between numbers except the last one
    }

    stdout.writeln(line);  // Print the result for the current row
    i++;  // Increment row counter to avoid infinite loop
  }
}
