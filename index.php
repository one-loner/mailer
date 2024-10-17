<?php
$uploadDir = 'uploads/';
$uploadedFiles = array_diff(scandir($uploadDir), array('..', '.'));

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['fileToUpload'])) {
    $file = $_FILES['fileToUpload'];
    $fileName = date('Y-m-d_H-i-s') . '_' . basename($file['name']);
    $targetFilePath = $uploadDir . $fileName;

    // Проверка на ошибки загрузки
    if ($file['error'] === UPLOAD_ERR_OK) {
        if (move_uploaded_file($file['tmp_name'], $targetFilePath)) {
            echo "Файл загружен: $fileName<br>";
        } else {
            echo "Ошибка при загрузке файла.<br>";
        }
    } else {
        echo "Ошибка загрузки: " . $file['error'] . "<br>";
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Загрузка файлов</title>
</head>
<body>
    <h1>Загрузка файла</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <input type="file" name="fileToUpload" required>
        <input type="submit" value="Загрузить">
    </form>

    <h2>Загруженные файлы</h2>
    <ul>
        <?php foreach ($uploadedFiles as $file): ?>
            <li>
                <a href="<?php echo $uploadDir . $file; ?>" download><?php echo $file; ?></a>
            </li>
        <?php endforeach; ?>
    </ul>
</body>
</html>
