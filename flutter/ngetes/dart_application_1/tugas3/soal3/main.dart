import 'dart:io';
import 'soal3.dart';

void main() {
  ATM atm = ATM(initialBalance: 1000000);
  atm.checkBalance();

  while (true) {
    print('Pilih operasi:');
    print('1. Deposit');
    print('2. Penarikan');
    print('3. Cek Saldo');
    print('4. Keluar');

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        print('Masukkan jumlah deposit:');
        double deposit = double.parse(stdin.readLineSync()!);
        atm.deposit(deposit);
        break;
      case 2:
        print('Masukkan jumlah penarikan:');
        double penarikan = double.parse(stdin.readLineSync()!);
        atm.withdraw(penarikan);
        break;
      case 3:
        atm.checkBalance();
        break;
      case 4:
        print('Keluar...');
        return;
      default:
        print('Pilihan tidak valid!');
    }
  }
}