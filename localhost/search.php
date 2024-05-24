
<!DOCTYPE html>
<html>
<head>
<title>магазинчик</title>
<meta charset="utf-8" />
<script>
function updateOutput(rangeInput, outputElement) {
  outputElement.value = rangeInput.value;
}
</script>
</head>
<body>
<h2>Продукты</h2>
<div style="margin-bottom: 10px;">

<form action="" method="get">
    <input type="text" name="search">
    <button style="background-color: gray; color: white; padding: 5px; border-radius: 5px;  text-decoration: none;" >Найти</button><br>
    <input type="range" min="10" max="1000" oninput="this.nextElementSibling.value = this.value"  name="pricee">дешевле <output>50</output>р</br>
    <input type="range" min="10" max="1000" oninput="this.nextElementSibling.value = this.value"  name="sklad">на складе больше <output>50</output>шт</br>
</form>
</div>
<?php
$conn = new mysqli("localhost", "root", "", "market");
if($conn->connect_error){
    die("Ошибка: ". $conn->connect_error);
}

$search = isset($_GET['search'])? $_GET['search'] : '';
$pricee = isset($_GET['pricee'])? $_GET['pricee'] : false;
$sklad = isset($_GET['sklad'])? $_GET['sklad'] : false;

$sql = "SELECT id, ProductName, price, kolvo FROM Products WHERE ProductName LIKE '%$search%'";

if ($pricee) {
    $sql.= " AND price < $pricee";
}
if ($sklad) {
    $sql.= " AND kolvo > $sklad";
}
if($result = $conn->query($sql)){
    echo "<table><tr><th>Название</th><th>цена</th><th>штук </th><th></th></tr>";
    foreach($result as $row){
        echo "<tr>";
            echo "<td>". $row["ProductName"]. "</td>";
            echo "<td>". $row["price"]. "</td>";
            echo "<td>". $row["kolvo"]. "</td>";
            echo "<td><form action='dobavlKorz.php' method='POST'>
            <input type='hidden' name='id' value='". $row["id"]. "' />
            <input style='border: none; cursor: pointer; background-color: gray; color: white; padding: 5px; border-radius: 5px;  text-decoration: none;' type='number' name='quantity' min='1' required>
            <input style='border: none; cursor: pointer; background-color: gray; color: white; padding: 5px; border-radius: 5px;  text-decoration: none;' type='submit' value='Добавить в корзину'>
        </form></td>";
        
        echo "<tr>";    
    }
    echo "</table>";
    $result->free();
} else{
    echo "Ошибка: ". $conn->error;
}
$conn->close();
 
echo "</table>";
?>

</body>
</html>