<!-- Write a PHP program to connect to a database and
retrieve data from a table and show the details in a neat format , a simple
application to Enter data into database, Develope a simple application to
Update, Delete table data from database.
 -->

 <?php
$servername = "localhost"; 
$username = "nikhil"; 
$password = "abc"; 
$dbname = "webdevlab"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $class = $_POST['class'];
    $roll = $_POST['roll'];
    $sql = "INSERT INTO users (Name, Class, Roll) VALUES ('$name', '$class', '$roll')";
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

if (isset($_POST['update'])) {
    $roll = $_POST['roll'];
    $name = $_POST['name'];
    $class = $_POST['class'];
    $sql = "UPDATE users SET Name='$name', Class='$class' WHERE Roll='$roll'";
    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
    } else {
        echo "Error: " . $conn->error;
    }
}

if (isset($_POST['delete'])) {
    $roll = $_POST['roll'];
    $sql = "DELETE FROM users WHERE Roll='$roll'";
    if ($conn->query($sql) === TRUE) {
        echo "Record deleted successfully";
    } else {
        echo "Error: " . $conn->error;
    }
}

$sql = "SELECT Name, Class, Roll FROM users";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
</head>
<body>

<h2>Add New User</h2>
<form method="POST">
    Name: <input type="text" name="name" required><br>
    Class: <input type="text" name="class" required><br>
    Roll: <input type="text" name="roll" required><br>
    <button type="submit" name="add">Add User</button>
</form>

<h2>Users List</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Class</th>
        <th>Roll</th>
        <th>Actions</th>
    </tr>
    <?php
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row['Name'] . "</td>";
            echo "<td>" . $row['Class'] . "</td>";
            echo "<td>" . $row['Roll'] . "</td>";
            echo "<td>
                    <form method='POST' style='display:inline'>
                    <input type='hidden' name='roll' value='" . $row['Roll'] . "'>
                    <input type='text' name='name' value='" . $row['Name'] . "' required>
                    <input type='text' name='class' value='" . $row['Class'] . "' required>
                    <button type='submit' name='update'>Update</button>
                    </form>
                    <form method='POST' style='display:inline'>
                    <input type='hidden' name='roll' value='" . $row['Roll'] . "'>
                    <button type='submit' name='delete'>Delete</button>
                    </form>
                  </td>";
            echo "</tr>";
        }
    } else {
        echo "<tr><td colspan='4'>No records found</td></tr>";
    }
    ?>
</table>

</body>
</html>

<?php
$conn->close();
?>

