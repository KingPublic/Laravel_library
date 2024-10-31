void main() {
  List<String> urutanTugas = [];

  // Menentukan urutan tugas berdasarkan ketergantungan
  void selesaikanTugas() {
    urutanTugas.add('Tugas A'); // Tugas A harus diselesaikan pertama
    urutanTugas.add('Tugas B'); // Tugas B bisa diselesaikan setelah Tugas A
    urutanTugas.add('Tugas C'); // Tugas C diselesaikan setelah A dan B
    urutanTugas.add('Tugas D'); // Tugas D diselesaikan setelah C
    urutanTugas.add('Tugas E'); // Tugas E bisa diselesaikan kapan saja
  }

  selesaikanTugas();

  // Menampilkan urutan tugas menggunakan while
  print("Urutan penyelesaian tugas:");
  int index = 0;
  while (index < urutanTugas.length) {
    print(urutanTugas[index]);
    index++;
  }
}
