<!DOCTYPE html>
<html>
<head>
    <title>Piramida Palindrome Perkalian Berulang</title>
    <style>
        .center {
            text-align: center;
            font-family: monospace;
            line-height: 1.5em;
        }
        .pyramid {
            text-align: center;
            font-family: monospace;
            line-height: 1.5em;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Piramida Palindrome Perkalian Berulang</h2>
    <form method="POST" style="text-align: center;">
        <label for="input_angka">Masukkan angka (maksimal 50):</label><br>
        <input type="text" id="input_angka" name="input_angka" maxlength="2" pattern="\d+" required><br><br>
        <input type="submit" value="Submit">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $input_angka = $_POST['input_angka'];

        // Validasi input angka untuk memastikan berada di rentang 1 hingga 50
        if (!ctype_digit($input_angka) || (int)$input_angka < 1 || (int)$input_angka > 50) {
            echo "<p style='text-align: center;'>Input harus berupa angka antara 1 hingga 50!</p>";
        } else {
            // Fungsi untuk membentuk palindrome dari hasil perkalian
            function buatPalindrome($num) {
                $num_str = (string)$num;
                return $num_str . strrev(substr($num_str, 0, -1));
            }

            // Konversi input menjadi angka
            $panjang = (int)$input_angka;  // Mendapatkan angka input

            echo "<div class='pyramid'>";
            $number = '';  // Untuk membentuk angka seperti 1, 11, 111, dst.
            for ($i = 1; $i <= $panjang; $i++) {
                $number .= '1';  // Tambahkan 1 ke akhir string setiap loop
                $hasil_perkalian = $number * $number;  // Kalikan angka tersebut dengan dirinya sendiri
                
                // Buat spasi untuk menyusun segitiga simetris
                $spasi = str_repeat("&nbsp;", $panjang - $i);  // Tambahkan spasi untuk perataan
                echo "<div style='text-align: center;'>$spasi$number x $number = $hasil_perkalian</div>";
            }
            echo "</div>";
        }
    }
    ?>
</body>
</html>
