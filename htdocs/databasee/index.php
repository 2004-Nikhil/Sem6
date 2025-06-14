<?php include 'db.php'; ?>

<h2>User List</h2>
<a href="add.php">Add New User</a>
<table border="1" cellpadding="10">
    <tr>
        <th>ID</th><th>Name</th><th>Email</th><th>Actions</th>
    </tr>
    <?php
    $result = $conn->query("SELECT * FROM users2");
    while($row = $result->fetch_assoc()):
    ?>
    <tr>
        <td><?= $row['id']; ?></td>
        <td><?= $row['name']; ?></td>
        <td><?= $row['email']; ?></td>
        <td>
            <a href="edit.php?id=<?= $row['id']; ?>">Edit</a> |
            <a href="delete.php?id=<?= $row['id']; ?>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>
