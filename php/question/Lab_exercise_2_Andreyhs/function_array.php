<?php

include 'variables.php';


class arrayfun extends Variables {}

$siswa1 = $user1;
$siswa2 = $user2;
$siswa3 = $user3;
$siswa4 = $user4;
$siswa5 = $user5;


$students = [$siswa1, $siswa2, $siswa3, $siswa4, $siswa5];

// $name = "";
// echo greet($name);
// print_r($students)
// echo $siswa1->age;
// print_r($students);

function greet($student)
{
    $menyapa = $student->age >= 18? "Hello, $student->name": "";
        return  $menyapa;
    
}

foreach ($students as $semuastudent) {
    echo "<br>" . greet($semuastudent) . "<br>"; 
}

for ($i=0;$i<count($students);$i++){ //tidak dapat $students->name[$i] karena $students->name bukan arrray...
    echo "<br>" . greet($students[$i]);//karena  yang array adalah $students dimana didalamnya baru ada objek dan juga cara panggilnya nanti seperti $students[$i]->name ini berarti variabel students  di index [] berapa itu akan mengambil name nya saja , dimana itu ada di property kelas variables
}

