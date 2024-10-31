import 'dart:io';
import 'dart:math';
import 'dart:async';

void clearScreen() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

int randomMax(int max) {
  return Random().nextInt(max);
}

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

void printFlag(){
  clearScreen();
  moveTo(0, 0);
  print("Thanks for waiting, but the flag is not here!");
}