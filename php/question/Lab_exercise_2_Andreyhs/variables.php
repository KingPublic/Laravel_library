<?php 
class Variables {
    public $name;
    public $value;
    public $age;  
    public $sex;
    public $gpa;
    public $isStudent;

    public function __construct($name, $ulangtahun, $sex, $gpa, $isStudent) {
        $this->name=$name;
        $this->age=$this->hitungumurstudent($ulangtahun); 
        $this->sex=$sex;
        $this->gpa=$gpa;
        $this->isStudent=$isStudent;
    }
    // public function hey ($value){ 
    //     $this->age=$this->hitungumurstudent($value);
    // }

    public function hitungumurstudent($ulangtahun) {
        $ulangtahun = new DateTime($ulangtahun);
        $harini = new DateTime(date('Y-m-d'));
        $age = $harini->diff($ulangtahun)->y;  
        // $tahun = $age->y;
        // $bulan = $age->m;
        // $hari = $age->d;
        // $age = "$tahun, $bulan, $hari";
        return $age;
    }

    
    // public function getName() {
    //     return $this->name;
    // }

    // public function setName($name) {
    //     $this->name = $name;
    // }

   
    // public function getAge() {
    //     return $this->age;
    // }

    // public function setAge($age) {
    //     $this->age = $age;
    // }

    
    // public function getSex() {
    //     return $this->sex;
    // }

    // public function setSex($sex) {
    //     $this->sex = $sex;
    // }

 
    // public function getGpa() {
    //     return $this->gpa;
    // }

    // public function setGpa($gpa) {
    //     $this->gpa = $gpa;
    // }

    
    // public function getIsStudent() {
    //     return $this->isStudent;
    // }

    // public function setIsStudent($isStudent) {
    //     $this->isStudent = $isStudent;
    // }
}


$user1 = new Variables('Andrey', "2005-03-25", 'M', 3.9, true);
// echo $this->hey("2005-03-25");
echo "Name: " . $user1->name . "\n";
echo "Age: " . $user1->age . "\n";
echo "Sex: " . $user1->sex . "\n";
echo "GPA: " . $user1->gpa. "\n";
echo "Is Student: " . ($user1->isStudent? 'Yes' : 'No') . "\n";

$user2 = new Variables('Amelia', "2009-03-25", 'F', 3.9, true);
echo  "<br>";
echo "Name: " . $user2->name . "\n";
echo "Age: " . $user2->age . "\n";
echo "Sex: " . $user2->sex . "\n";
echo "GPA: " . $user2->gpa. "\n";
echo "Is Student: " . ($user1->isStudent? 'Yes' : 'No') . "\n";

$user3 = new Variables('Madek', "2006-03-25", 'M', 3.9, true);
echo "<br>";
echo "Name: " . $user3->name . "\n";
echo "Age: " . $user3->age . "\n";
echo "Sex: " . $user3->sex . "\n";
echo "GPA: " . $user3->gpa. "\n";
echo "Is Student: " . ($user1->isStudent? 'Yes' : 'No') . "\n";

$user4 = new Variables('Nanda', "2002-03-25", 'F', 3.9, true);
echo  "<br>";
echo "Name: " . $user4->name . "\n";
echo "Age: " . $user4->age . "\n";
echo "Sex: " . $user4->sex . "\n";
echo "GPA: " . $user4->gpa. "\n";
echo "Is Student: " . ($user1->isStudent? 'Yes' : 'No') . "\n";

$user5 = new Variables('Malia', "2004-03-25", 'F', 3.9, true);
echo "<br>";
echo "Name: " . $user5->name . "\n";
echo "Age: " . $user5->age . "\n";
echo "Sex: " . $user5->sex . "\n";
echo "GPA: " . $user5->gpa. "\n";
echo "Is Student: " . ($user1->isStudent? 'Yes' : 'No') . "\n";
?>
