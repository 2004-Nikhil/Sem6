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
        
        <label for="number2">Enter a second number:</label>
        <input type="number" name="numbers2" id="number2" required>

        <label for="number3">Enter a third number:</label>
        <input type="number" name="numbers3" id="number3" required>

        <input type="submit" value="Check">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $number1 = $_POST['numbers'];
        $number2 = $_POST['numbers2'];
        $number3 = $_POST['numbers3'];
        
        $max = max($number1, $number2, $number3);
        echo "<p>The maximum number is $max.</p>";
    }
    ?>

</body>
</html>