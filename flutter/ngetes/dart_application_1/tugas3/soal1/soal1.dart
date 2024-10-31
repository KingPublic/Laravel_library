class Siswa {
  String _nama;
  int _nim;
  int _nilai;

  Siswa({required String nama, required int nim, required int nilai})
      : _nama = nama,
        _nim = nim,
        _nilai = nilai;

  String get nama => _nama;
  set nama(String value) => _nama = value;

  int get nim => _nim;
  set nim(int value) => _nim = value;

  int get nilai => _nilai;
  set nilai(int value) => _nilai = value;

  void tampilkanInfoSiswa() {
    print("\n");
    print('Nama: $_nama');
    print('NIM: $_nim');
    print('Nilai: $_nilai');
  }

  bool telahLulus() {
    return _nilai >= 70;
  }
}