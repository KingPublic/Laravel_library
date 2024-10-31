//soal11
void main() {
  int baterai = 100; // Baterai awal
  int waktuChatting = 60; // Waktu chatting dalam menit
  int waktuVideo = 30; // Waktu menonton video dalam menit
  int waktuGame = 45; // Waktu bermain game dalam menit

  // Penggunaan baterai per 5 menit
  int penguranganChatting = 1; // 1% setiap 5 menit
  int penguranganVideo = 2; // 2% setiap 5 menit
  int penguranganGame = 3; // 3% setiap 5 menit

  // Menghitung total pengurangan baterai
  int totalPengurangan = 0;

  // Menghitung pengurangan baterai untuk masing-masing aplikasi
  // Menggunakan 1 while untuk semua aplikasi
  int i = 0;
  while (i < 3) {
    if (i == 0) {
      totalPengurangan += (waktuChatting ~/ 5) * penguranganChatting; // Chatting
    } else if (i == 1) {
      totalPengurangan += (waktuVideo ~/ 5) * penguranganVideo; // Video
    } else {
      totalPengurangan += (waktuGame ~/ 5) * penguranganGame; // Game
    }
    i++;
  }

  // Mengurangi total pengurangan dari baterai
  baterai -= totalPengurangan;

  // Menampilkan sisa baterai
  print("Sisa baterai setelah penggunaan: $baterai%");
}
