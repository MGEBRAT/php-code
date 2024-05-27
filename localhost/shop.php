<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Оформление заказа</title>
</head>
<body>
    <h2>Оформление заказа</h2>
    <form action="oform.php" method="POST">
        <label for="address">Адрес доставки:</label>
        <input type="text" id="address" name="address" required><br><br>

        <label for="time">Во сколько доставить:</label>
        <input type="text" id="time" name="time" required><br><br>

        <input type="submit" value="Оформить заказ">
    </form>
</body>
</html>