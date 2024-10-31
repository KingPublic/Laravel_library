<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laravelku</title>

    <style>
        .kepala {
            text-align: center;
            color: antiquewhite;
            padding-top: 50px;
        }
        body {
            background-image: url('/anime.jpg'); 
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover; 
            margin: 0;
            padding: 0;
            height: 100vh; 
            z-index: 1;
        }
        .mulai {
            text-align: center;
            margin-top: 350px;
        }
        .mulai button {
            padding: 10px 20px;
            font-size: 20px;
            border: 2px solid antiquewhite;
            border-radius: 10px;
            background-color: pink;
            color: antiquewhite;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .mulai button:hover {
            background-color: antiquewhite;
            color: #333;
            
        }

       
    </style>

</head>
<body>

    <div class="kepala">
        <h1>Hello Kingand</h1> 
        <br>
        <h2>Selamat datang di project laravelmu</h2>
    </div>

    <div class="mulai">
        <button onclick="mulai()">Start</button>
    </div>



    <script>
        function mulai(){
            alert('Kamu sudah siap?')
        }
    </script>
    
</body>
</html>
