<?php include 'db.php'; ?>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $conn->query("INSERT INTO users2 (name, email) VALUES ('$name', '$email')");
    header("Location: index.php");
}
?>

<h2>Add User</h2>
<form method="POST">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    <button type="submit">Add</button>
</form>
<a href="index.php">Back to List</a>
