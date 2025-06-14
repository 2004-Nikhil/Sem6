<?php
// Start the session (needed for session-based counter)
session_start();

// 1. COOKIE-BASED COUNTER
// -----------------------
// Check if the 'cookie_counter' cookie exists.
// If it does, retrieve its value and increment by 1.
// If not, initialize it to 1.
if (isset($_COOKIE['cookie_counter'])) {
    $cookie_count = intval($_COOKIE['cookie_counter']) + 1;
} else {
    $cookie_count = 1;
}

// Set (or update) the 'cookie_counter' cookie.
// Expires in 30 days (30 days * 24 hours * 60 minutes * 60 seconds).
setcookie('cookie_counter', strval($cookie_count), time() + (30 * 24 * 60 * 60));

// 2. SESSION-BASED COUNTER
// ------------------------
// Check if the 'session_counter' variable exists in this session.
// If it does, increment it by 1. If not, initialize it to 1.
if (isset($_SESSION['session_counter'])) {
    $_SESSION['session_counter']++;
} else {
    $_SESSION['session_counter'] = 1;
}

// 3. DISPLAY VALUES
// -----------------
// We display both counters and also dump the $_COOKIE array
// to show how cookies are stored/retrieved in PHP.
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cookie &amp; Session Counter</title>
</head>
<body>

    <div class="counter-box">
        <h2>Cookie-Based Counter</h2>
        <p>
            <strong>Visits (stored in a cookie):</strong>
            <?php echo htmlspecialchars($cookie_count); ?>
        </p>

        <h2>Session-Based Counter</h2>
        <p>
            <strong>Visits (stored in session):</strong>
            <?php echo htmlspecialchars($_SESSION['session_counter']); ?>
        </p>

        <h2>All Cookies (via <code>$_COOKIE</code>)</h2>
        <div class="cookie-list">
            <pre><?php print_r($_COOKIE); ?></pre>
        </div>
    </div>

</body>
</html>
