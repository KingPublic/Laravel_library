import 'dart:io';

class Bankaccount {
  double _saldo;

  Bankaccount({required double saldoAwal}) : _saldo = saldoAwal;

  void setor(double jumlah) {
    if (jumlah >= 50000) {
      _saldo += jumlah;
      print('Deposit berhasil! Saldo sekarang: $_saldo');
    } else {
      print('Minimal deposit adalah 50000!');
    }
  }

  void tarik(double jumlah) {
    if (jumlah >= 50000) {
      if (jumlah > _saldo) {
        print('Saldo tidak cukup!');
      } else {
        _saldo -= jumlah;
        print('Penarikan berhasil! Saldo sekarang: $_saldo');
      }
    } else {
      print('Minimal penarikan adalah 50000!');
    }
  }

  double cekSaldo() {
    return _saldo;
  }
}

class Savingaccount extends Bankaccount {
  double _bunga;

  Savingaccount({required double saldoAwal, required double bunga})
      : _bunga = bunga,
        super(saldoAwal: saldoAwal);

  void tambahBunga() {
    _saldo += (_saldo * _bunga / 100);
    print('Bunga telah ditambahkan! Saldo sekarang: $_saldo');
  }
}

