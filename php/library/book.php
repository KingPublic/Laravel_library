<?php

class book {
    private $title;
    private $author;
    private $publicationyear;

    public function __construct($title, $author, $publicationyear) {
        $this->title = $title;
        $this->author = $author;
        $this->publicationyear = $publicationyear;
    }

    public function getDetails() {
        $result = "";
        if ($this->publicationyear >= 1500 && $this->publicationyear <= 2024) {
            $result .= "<span style='color:red';>Title</span>: {$this->title}, <span style='color:blue';>Author</span>: {$this->author}, <span style='color:green';>Year</span>: {$this->publicationyear}";
        } 
        else if ($this->publicationyear < 1500 && $this->publicationyear >= 2024){//gak begitu berguna ini sampai bawah nya :) karena udah ada if diatasnya yang return semua nilai nya sebenarnya cmn untuk check publication year nya
            $result .= "Sorry your Publication Year is out of date<br>";
        }
        if (isset($this->title) && strlen($this->title) > 100) {
            $result .= "Your title cannot more than 100 characters<br>";
        }
        else if (isset($this->title) && strlen($this->title) <= 0) {
            $result .= "Your title is empty<br>";
        }
        if (isset($this->author) && strlen($this->title) > 100) {
            $result .= "Your author name cannot more than 100 characters<br>";
        }
        else if (isset($this->author) && strlen($this->title) <= 0) {
            $result .= "Your author name is empty<br>";
        }
        return $result;
    }
}
?>
