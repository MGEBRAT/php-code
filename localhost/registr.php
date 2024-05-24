<!DOCTYPE html>
<html>
<head>
  <title>Регистрация</title>
</head>
<body>
  <div>
    <h1>Регистрация</h1>
    <form action="createUser.php" method="post">
      <input type="text" name="UserName" placeholder="Username" required><br>
      <input type="email" name="Email" placeholder="Email" required><br>
      <input type="password" name="password" placeholder="Password" required><br>
      <input type="submit" value="Регистрация">
    </form>
  </div>
</body>
</html>