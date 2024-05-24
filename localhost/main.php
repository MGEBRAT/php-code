<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Главная</title>
</head>
<body>
<?php
session_start();        
if (isset($_SESSION["name"] )) {
    $userName = $_SESSION["name"];
    echo "Привет, ". $userName. "! Добро пожаловать на наш сайт.";
} else if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
    echo "Привет, $username!";
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
</body>
</html>
