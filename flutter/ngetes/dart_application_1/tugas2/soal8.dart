void main() {
  // Konsumsi energi per jam (dalam kWh)
  const double acKwhPerJam = 1.5;
  const double tvKwhPerJam = 0.2;
  const double lampuKwhPerJam = 0.1;

  // Penggunaan alat dalam jam per hari
  const int acJamPerHari = 8;
  const int tvJamPerHari = 5;
  const int lampuJamPerHari = 12;

  // Menghitung konsumsi energi harian
  double totalKonsumsiAC = acKwhPerJam * acJamPerHari;
  double totalKonsumsiTV = tvKwhPerJam * tvJamPerHari;
  double totalKonsumsiLampu = lampuKwhPerJam * lampuJamPerHari;

  // Menghitung total konsumsi energi harian
  double totalKonsumsiHarian = totalKonsumsiAC + totalKonsumsiTV + totalKonsumsiLampu;

  // Menampilkan hasil
  print("Total konsumsi energi harian keluarga adalah: $totalKonsumsiHarian kWh");
}
