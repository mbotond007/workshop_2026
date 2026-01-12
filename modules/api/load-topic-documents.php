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
    // Egységesített hiba-kezelés: hibánál HTTP 500 kódot és JSON választ küldünk.
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "error" => "Database query failed: " . $connection->error
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
