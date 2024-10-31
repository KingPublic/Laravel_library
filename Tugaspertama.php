
<?php
    echo "<strong>No 1. 1 Baris Hello World: </strong><br>";
    echo "Hello World"; 
    echo "<br><br>";
    
    echo "<strong>No 2. 10 Baris Hello World: </strong><br>";
    for($j = 1; $j <= 10; $j++) {
        echo "Hello World<br>";
    }
    echo "<br><br>";
    
    echo "<strong>No 3. 10 Baris Hello World Dengan Nomor Baris di Angka Genap: </strong><br>";
    for($j = 1; $j <= 10; $j++) {
        echo 'Hello World'. (($j % 2 == 0) ? (' - '. $j) : '') .'<br>';
    }
    echo "<br><br>";
    
    echo "<strong>No 4. Array Nama Bulan: </strong><br>";
    $DaftarBulan = [
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
    ];

    foreach($DaftarBulan as $Bulan) {
        echo $Bulan . "<br>";
    }
    echo "<br><br>";
    
    echo "<strong>No 5. Array Nama Bulan dan Hari Libur: </strong><br>";
    $Libur = [
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
    ];

    $BulanLibur = []; // Cara Memasukkan data ke array 2 dimensi
    for($k = 0; $k < count($DaftarBulan); $k++) {
        $BulanLibur[$k] = [$DaftarBulan[$k], $Libur[$k]];
    }

    foreach($BulanLibur as $Tgl) {
        echo $Tgl[0] ." - ". $Tgl[1] ."<br>";
    }
    echo "<br><br>";

    echo "<strong>No 6. 4 Function Aritmatika: </strong><br>";
    function tambah_angka($num1, $num2) {
        return $num1 + $num2;
    }
    function kurang_angka($num1, $num2) {
        return $num1 - $num2;
    }
    function kali_angka($num1, $num2) {
        return $num1 * $num2;
    }
    function bagi_angka($num1, $num2) {
        return $num1 / $num2;
    }

    $num1 = 10; 
    $num2 = 5;

    echo "Angka 1 = $num1<br>Angka 2 = $num2<br><br>Penggunaan Function: <br>";
    echo 'Penjumlahan ('.$num1.' + '.$num2.'): '. tambah_angka($num1, $num2) .'<br>';
    echo 'Pengurangan ('.$num1.' - '.$num2.'): '. kurang_angka($num1, $num2) .'<br>';
    echo 'Perkalian ('.$num1.' * '.$num2.'): '. kali_angka($num1, $num2) .'<br>';
    echo 'Pembagian ('.$num1.' / '.$num2.'): '. bagi_angka($num1, $num2) .'<br>';
?>
