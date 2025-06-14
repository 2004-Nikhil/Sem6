
<?php
if (isset($_POST['upload'])) {
    $targetDir = "uploads/";

    $targetFile = $targetDir . basename($_FILES['file']['name']);

    $fileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
    $fileSize = $_FILES['file']['size'];

    $allowedTypes = ['pdf', 'png'];

    if (!in_array($fileType, $allowedTypes)) {
        echo "Wront Format.";
    } elseif ($fileSize > 2 * 1024 * 1024) {
        echo "File size is greater than max size.";
    } else {
        if (move_uploaded_file($_FILES['file']['tmp_name'], $targetFile)) {
            echo "The file has been uploaded.";
        } else {
            echo "Error uploading file.";
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
</head>
<body>

<h2>Upload File</h2>
<form method="POST" enctype="multipart/form-data">
    Select file: <input type="file" name="file" required>
    <button type="submit" name="upload">Upload</button>
</form>

</body>
</html>

