<?php

require_once 'book.php';

class ebook extends book {
    private $fileSize;

    public function __construct($title, $author, $publicationyear, $fileSize) {
        parent::__construct($title, $author, $publicationyear)  ;
        $this->fileSize = $fileSize;
    }

    public function getDetails() {
        $result = "";
        if ($this->fileSize > 100 && $this->fileSize < 0) {
        $result .= parent::getDetails() . ", Your file size is large or else too small";
        }
        else{
            $result .= parent::getDetails() .", <span style='color:red';>File size</span>: $this->fileSize";
        }
        return $result;
    }
}
?>
