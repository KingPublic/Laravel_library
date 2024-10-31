<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .pe{
            text-align: center;
            text-shadow: 12px;
            box-shadow: black 80px;
        }

        .container{
            border-color: black;
            box-shadow:  20px;
            bottom: 50%;
            top: 50%;
        }
    </style>
</head>
<body>
    <div class = coontainer>
        <?php
            $today = date("l");
            
        ?>
        <p class="pe">
            <?php
                echo $today
            ?>
        </p>
    </div>

    <?php
        $d = date("h:i:sa");
        $tomorrow = date('l', $d);
        echo "Tanggal hari esok: " . $tomorrow . $d;
    ?>

    
</body>
</html>