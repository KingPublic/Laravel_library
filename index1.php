<?php
    echo "<strong>1 Baris Hello World: </strong><br>";
    echo "Hello World"; // 1 Baris Hello World
    echo "<br><br>";
    
    echo "<strong>10 Baris Hello World: </strong><br>";
    for($i = 1; $i <= 10; $i++) {
        echo "Hello World<br>"; // 10 Baris Hello World
        }
    echo "<br><br>";
    
    echo "<strong>10 Baris Hello World Dengan Nomor Baris di Angka Genap: </strong><br>";
    for($i = 1; $i <= 10; $i++) {
        echo 'Hello World'. (($i % 2 == 0) ? (' - '. $i) : '') .'<br>'; // 10 Baris Hello World dengan Nomor Baris Ketika Genap
        }
    echo "<br><br>";
    
    echo "<strong>Array Nama Bulan: </strong><br>";
    $NamaBulan = [
        "Januari", 
        "Februari", 
        "Maret", 
        "April", 
        "Mei", 
        "Juni", 
        "Juli", 
        "Agustus", 
        "September", 
        "Oktober", 
        "November", 
        "Desember"
    ]; // Nama Bulan

    foreach($NamaBulan as $Bulan) {
        echo $Bulan . "<br>"; //Tampilkan Nama Bulan
    }
    echo "<br><br>";
    
    echo "<strong>Array Nama Bulan dan Hari Libur: </strong><br>";
    $HariLibur = [
        "Tahun Baru",
        "Valentine",
        "Nyepi",
        "Paskah",
        "Hari Buruh",
        "Hari Lahir Pancasila",
        "Idul Adha",
        "Kemerdekaan",
        "Maulid Nabi Muhammad SAW",
        "Idul Fitri",
        "Hari Pahlawan",
        "Natal",
    ]; // Hari Libur

    $Arr2D = [];
    for($i = 0; $i < count($NamaBulan); $i++) {
        $Arr2D[$i] = [$NamaBulan[$i], $HariLibur[$i]]; // Memasukkan Ke Array 2 Dimensi
    }

    foreach($Arr2D as $Tanggal) {
        echo $Tanggal[0] ." - ". $Tanggal[1] ."<br>"; //Tampilkan Nama Bulan dan Hari Libur
    }
    echo "<br><br>";

    echo "<strong>4 Function Aritmatika: </strong><br>";
    function tambah($nomor1, $nomor2) {
        return $nomor1 + $nomor2; // Pembuatan Function Penjumlahan
    }
    function kurang($nomor1, $nomor2) {
        return $nomor1 - $nomor2; // Pembuatan Function Pengurangan
    }
    function kali($nomor1, $nomor2) {
        return $nomor1 * $nomor2; // Pembuatan Function Perkalian
    }
    function bagi($nomor1, $nomor2) {
        return $nomor1 / $nomor2; // Pembuatan Function Pembagian
    }

    $angka1 = 10; 
    $angka2 = 5;
    echo "Angka 1 = $angka1<br>Angka 2 = $angka2<br><br>Penggunaan Function: <br>";
    echo 'Penjumlahan ('.$angka1.' + '.$angka2.'): '. tambah($angka1, $angka2) .'<br>'; // Penggunaan Function Penjumlahan
    echo 'Pengurangan ('.$angka1.' - '.$angka2.'): '. kurang($angka1, $angka2) .'<br>'; // Penggunaan Function Pengurangan
    echo 'Perkalian ('.$angka1.' * '.$angka2.'): '. kali($angka1, $angka2) .'<br>'; // Penggunaan Function Perkalian
    echo 'Pembagian ('.$angka1.' / '.$angka2.'): '. bagi($angka1, $angka2) .'<br>'; // Penggunaan Function Pembagian


?>