
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
session_start();

// Connect to the database
$conn = new mysqli("localhost", "root", "", "market");
if ($conn->connect_error) {
    die("Ошибка: ". $conn->connect_error);
}

// Retrieve the products from the database
$cartItems = [];
if (isset($_SESSION['cart'])) {
    $productIds = implode(',', array_keys($_SESSION['cart']));
    $sql = "SELECT id, ProductName, price FROM Products WHERE id IN ($productIds)";
    $result = $conn->query($sql);
    while ($row = $result->fetch_assoc()) {
        $productId = $row['id'];
        $cartItems[$productId] = [
            'name' => $row['ProductName'],
            'price' => $row['price'],
            'quantity' => $_SESSION['cart'][$productId],
        ];
    }
}

// Display the shopping cart
echo "<h2>Корзина</h2>";
echo "<table><tr><th>Название</th><th>цена</th><th>штук </th></tr>";
foreach ($cartItems as $productId => $item) {
    echo "<tr>";
    echo "<td>". $item['name']. "</td>";
    echo "<td>". $item['price']. "</td>";
    echo "<td>". $item['quantity']. "</td>";
    echo "</tr>";
}
echo "</table>";


$conn->close();
?>
<a style='border: none; cursor: pointer; background-color: gray; color: white; padding: 5px; border-radius: 5px;  text-decoration: none;'  href="main.php">На главную</a>
</body>
</html>