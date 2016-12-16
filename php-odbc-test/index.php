<?php

$sql = 'SELECT * FROM [mytable]';

$pdo = require __DIR__.'/pdo.php';

header('Content-Type: application/json');

echo json_encode($pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC));
