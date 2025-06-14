<!-- Create aphp 
program to find odd or even number from given number. Write a php 
program to find maximum of three numbers.  -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odd or Even Number</title>
</head>
<body>
    
    <h1>Odd or Even Number</h1>
    <form method="post" action="">
        <label for="number">Enter a number:</label>
        <input type="number" name="numbers" id="number" required>
        <input type="submit" value="Check">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $number = $_POST['numbers'];
        if ($number % 2 == 0) {
            echo "<p>$number is an even number.</p>";
        } else {
            echo "<p>$number is an odd number.</p>";
        }
    }
    ?>

</body>
</html>