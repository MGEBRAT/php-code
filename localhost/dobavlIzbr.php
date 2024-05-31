<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['username'])) {
    echo "Вы не вошли в систему.";
    exit;
}

// Get the user's username
$username = $_SESSION['username'];

// Connect to the database
$conn = new mysqli("localhost", "root", "", "market");
if ($conn->connect_error) {
    die("Ошибка подключения: ". $conn->connect_error);
}

// Fetch the user's ID based on the username
$sql = "SELECT id FROM users WHERE username = '$username'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $user_id = $row['id'];
} else {
    echo "Пользователь не найден.";
    exit;
}

// Get the product ID from the POST request
$product_id = $_POST['id'];

// Insert the user ID and product ID into the database
$sql = "INSERT INTO favorites (user_id, product_id) VALUES ('$user_id', '$product_id')";

if ($conn->query($sql) === TRUE) {
    echo "Продукт успешно добавлен в избранное.
    <a href='izbr.php'> избранные </a>";
} else {
    echo "Ошибка: ". $sql. "<br>". $conn->error;
}

$conn->close();
?>


