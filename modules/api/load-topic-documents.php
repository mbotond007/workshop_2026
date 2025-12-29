<?php
require_once __DIR__ . '/../../config/connect.php';

header('Content-Type: application/json; charset=utf-8');

$sql = "
    SELECT
        topic_id,
        document_id
    FROM topic_documents
    ORDER BY topic_id, document_id
";

$result = $connection->query($sql);

if (!$result) {
    echo json_encode([
        "success" => false,
        "error" => $connection->error
    ]);
    exit;
}

$data = [];
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

echo json_encode([
    "success" => true,
    "data" => $data
]);
