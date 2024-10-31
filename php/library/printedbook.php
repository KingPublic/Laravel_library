<?php

require_once 'book.php';

class printedbook extends book {
    private $numberpages;

    public function __construct($title, $author, $publicationyear, $numberpages) {
        parent::__construct($title, $author, $publicationyear);
        $this->numberpages = $numberpages;
    }

    public function getDetails() {
        $result = '';
        if ($this->numberpages > 0) {
        return parent::getDetails() . ", <span style='color:red';>Pages</span>: {$this->numberpages}";
        }
    }

}
?>
