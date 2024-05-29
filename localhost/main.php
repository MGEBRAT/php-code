<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/style.css">
    <title>Главная</title>
</head>
<body>
<?php
session_start();        
$username = isset($_SESSION["name"])? $_SESSION["name"] : (isset($_SESSION["username"])? $_SESSION["username"] : null);

if ($username) {
    echo "Привет, $username! Добро пожаловать на наш сайт.";
} else {
    echo "Пожалуйста, войдите в систему.";
}
?>


    <h1 style='display:flex; justify-content: center;' >Главная</h1>
    <div style='margin-top: 20px; display: flex; gap: 20px; '>
        <a style=' 
            background-color: gray; 
            color: white; 
            padding: 5px; 
            border-radius: 5px; 
            text-decoration: none;' 
            href='http://localhost/search.php'>
            Продукты
        </a>
        <a style=' 
            background-color: gray; 
            color: white; 
            padding: 5px; 
            border-radius: 5px; 
            text-decoration: none;' 
            href='zakazproduct.php'>
            история покупок
        </a>
        <a style=' 
            background-color: gray; 
            color: white; 
            padding: 5px; 
            border-radius: 5px; 
            text-decoration: none;' 
            href='http://localhost/categoryProduct.php'>
            категории продуктов
        </a>
        <a style=' 
            background-color: gray; 
            color: white; 
            padding: 5px; 
            border-radius: 5px; 
            text-decoration: none;' 
            href='http://localhost/korzina.php'>
            ваша карзина
        </a>
        <form action="logout.php" method="post">
            <button style=' 
                background-color: gray; 
                color: white; 
                padding: 5px; 
                border-radius: 5px; 
                text-decoration: none;'>
                Выйти
            </button>
        </form>
    </div>



    <div class="container">
    <div >
        <div class="smesharic">
            <div class="head"></div>
            <div class="nogi">
                <div class="left-noga"></div>
                <div class="right-noga"></div>
            </div>
            
        </div>
        <div class="pol">
            <div class="kubic"></div>
        </div>
    </div>
</div>



</body>
</html>
