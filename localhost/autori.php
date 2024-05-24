
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация</title>
</head>
<body>
<form style="display: flex; flex-direction: column; width: 200px; margin: auto; gap: 5px;" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <input type="submit" value="Login">
</form>

<?php
session_start();

$conn = new mysqli("localhost", "root", "", "market");
if($conn->connect_error){
    die("Ошибка: ". $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usernameInput = $_POST['username'];
    $passwordInput = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM Users WHERE UserName =? AND Password =?");
    $stmt->bind_param("ss", $usernameInput, $passwordInput);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        header("Location: main.php");
        $_SESSION["username"] = $usernameInput;
        exit();
    } else {
        echo "неверно";
    }

    $stmt->close();
}

$conn->close();
?>


</body>
</html>