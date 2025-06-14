<?php
// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['username'])) {
    $username = trim($_POST['username']);
    if ($username !== '') {
        // Set cookie for 1 hour
        setcookie('username', $username, time() + 3600, "/");
        // Redirect to avoid form resubmission
        header("Location: " . $_SERVER['PHP_SELF']);
        exit;
    }
}

// Get username from cookie if set
$savedUsername = isset($_COOKIE['username']) ? htmlspecialchars($_COOKIE['username']) : '';
?>
<!DOCTYPE html>
<html>
<head>
    <title>User Cookie Example</title>
</head>
<body>
    <?php if ($savedUsername): ?>
        <p>Welcome, <?php echo $savedUsername; ?>!</p>
    <?php else: ?>
        <form method="post" action="">
            <label for="username">Enter your name:</label>
            <input type="text" id="username" name="username" required>
            <button type="submit">Save</button>
        </form>
    <?php endif; ?>
</body>
</html>