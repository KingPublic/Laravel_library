// soal1s.dart
import 'dart:io';  

void printPyramidSorted(List<int> angka) {
  
  angka.sort();

  int rows = angka.length;
  int i = 0;  

  while (i < rows) {
    String line = "";

    
    for (int j = 0; j < (rows + i); j++) {
      
      line += (j < rows - i - 1) 
        ? " "   
        : "${angka[(j - (rows - i - 1)) % angka.length]}" +
          ((j < rows + i - 1) ? " " : "");  
    }

    stdout.writeln(line);  
    i++;  
  }
}
