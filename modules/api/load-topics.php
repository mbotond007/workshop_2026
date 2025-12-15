<?php
require_once __DIR__ . '/../../config/connect.php';

header('Content-Type: application/json; charset=utf-8');

$sql = "
    SELECT
        topic_id,
        branch_id,
        topic_name_hu,
        has_subtopic,
        sort_order
    FROM topics
    ORDER BY branch_id, sort_order
";

$result = $connection->query($sql);

if (!$result) {
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
?>