void main() {
  int jumlahMesinCuci = 3;
  double waktuPerMesinCuci = 2; // dalam jam
  double waktuPerPenghuni = 1.5; // dalam jam

  // Menghitung total waktu yang tersedia untuk mencuci
  double totalWaktu = jumlahMesinCuci * waktuPerMesinCuci;

  // Menghitung jumlah penghuni yang dapat mencuci
  int jumlahPenghuni = (totalWaktu ~/ waktuPerPenghuni).toInt();

  // Menampilkan hasil
  print("Jumlah penghuni yang dapat mencuci di hari yang sama ada: $jumlahPenghuni");
}
