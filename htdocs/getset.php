<!-- Write a PHP Program to demonstrate the variable
function: gettype() and settype() -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>gettype</title>
</head>
<body>
    <?php

        $var = "123.45";
        echo "The type of var is: " . gettype($var) . "<br>";

        settype($var, "integer");
        echo "After settype(), the type of var is: " . gettype($var) . "<br>";
        
        $var = "Hello, World!";
        echo "The original value of var is: " . $var . "<br>";
        
        unset($var);
        echo "After unset(), var is: " . (isset($var) ? $var : 'undefined') . "<br>";
    ?>
</body>
</html>