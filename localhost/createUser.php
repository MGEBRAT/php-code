<?php
session_start();

if (isset($_POST["UserName"]) && isset($_POST["Email"]) && isset($_POST["password"])) {
      
    $conn = new mysqli("localhost", "root", "", "market");
    if($conn->connect_error){
        die("Ошибка: " . $conn->connect_error);
    }
    $UserName = $conn->real_escape_string($_POST["UserName"]);
    $Email = $conn->real_escape_string($_POST["Email"]);
    $password = $conn->real_escape_string($_POST["password"]);
    $sql = "INSERT INTO Users (UserName, Email, password) VALUES ('$UserName', '$Email', '$password' )";
    if($conn->query($sql)){
        $_SESSION["name"] = $UserName;
        echo "Данные успешно добавлены";
        echo "<div style='margin-top: 20px; display: flex; '> <a style=' background-color: gray; color: white; padding: 5px; border-radius: 5px;  text-decoration: none;' href='http://localhost/main.php'>вернутся на главную</a>";
    } else{
        echo "Ошибка: " . $conn->error;
    }
    $conn->close();
}
?>
<?php



?>