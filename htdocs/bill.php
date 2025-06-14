<!-- Write a PHP program to input previous reading and present reading
and prepare an electricity bill using the following conditions.
Units Consumed           Rate
<100                             Rs.3/ Unit
Between 100 and200     Rs.4/ Unit
Between 200 and300     Rs.5/ Unit
>300                             Rs.6/ Unit -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill</title>
</head>
<body>
    <form method="post" action="">
        <label for="previous_reading">Previous Reading :</label>
        <input type="number" name="previous_reading" id="previous_reading" required><br><br>

        <label for="present_reading">Present Reading :</label>
        <input type="number" name="present_reading" id="present_reading" required><br><br>

        <input type="submit" value="submit">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $previous_reading = $_POST['previous_reading'];
        $present_reading = $_POST['present_reading'];

        $units_consumed = $present_reading - $previous_reading;
        $bill_amount = 0;

        if ($units_consumed < 100) 
        {
            $bill_amount = $units_consumed * 3;
        } 
        elseif ($units_consumed >= 100 && $units_consumed <= 200) 
        {
            $bill_amount = 300 + ($units_consumed - 100) * 4;
        } 
        elseif ($units_consumed > 200 && $units_consumed <= 300) 
        {
            $bill_amount = 700 + ($units_consumed - 200) * 5;
        } 
        else 
        {
            $bill_amount = 1200 + ($units_consumed - 300) * 6;
        }

        echo "<h2>Your Electricity Bill</h2>";
        echo "<p>Units Consumed: $units_consumed</p>";
        echo "<p>Total Bill Amount: Rs. $bill_amount</p>";
    }
    ?>
</body>
</html>