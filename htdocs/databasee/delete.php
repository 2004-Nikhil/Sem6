<?php include 'db.php'; ?>
<?php
$id = $_GET['id'];
$conn->query("DELETE FROM users2 WHERE id=$id");
header("Location: index.php");
?>
