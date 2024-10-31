import 'dart:io';

class ATM {
  double _balance;

  ATM({required double initialBalance}) : _balance = initialBalance;

  void deposit(double amount) {
    if (amount >= 50000) {
      _balance += amount;
      print('Deposit successful. New balance: $_balance');
    } else {
      print('Minimal deposit adalah 50000. Silakan coba lagi.');
    }
  }

  void withdraw(double amount) {
    if (amount >= 50000 && amount <= _balance) {
      _balance -= amount;
      print('Penarikan berhasil. Saldo sekarang: $_balance');
    } else if (amount > _balance) {
      print('Saldo tidak cukup, penarikan $amount, saldo Anda adalah $_balance. Silakan coba lagi.');
    } else {
      print('Minimal penarikan adalah 50000. Silakan coba lagi.');
    }
  }

  void checkBalance() {
    print('Saldo sekarang: $_balance');
  }
}

