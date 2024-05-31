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

// Get the products added to the user's favorites
$sql = "SELECT * FROM Products WHERE id IN (SELECT product_id FROM favorites WHERE user_id = '$user_id')";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output the products
    while($row = $result->fetch_assoc()) {
        echo "Название: ". $row["ProductName"]. "<br>";
    }
} else {
    echo "У вас нет избранных продуктов.";
}

$conn->close();
?>