<?php
require_once __DIR__ . '/../../config/connect.php';

header('Content-Type: application/json; charset=utf-8');

// 1) Glossary terms (HU mezők + tags)
$sqlGlossary = "
    SELECT
        glossary_id,
        term_name_hu,
        term_definition_hu,
        short_hu,
        tags
    FROM glossary
    ORDER BY glossary_id
";

$resGlossary = $connection->query($sqlGlossary);

if (!$resGlossary) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "error" => "Database query failed (glossary): " . $connection->error
    ]);
    exit;
}

$glossary = [];
while ($row = mysqli_fetch_assoc($resGlossary)) {
    $glossary[] = $row;
}

// 2) Topic-Glossary relations
$sqlRel = "
    SELECT
        topic_id,
        glossary_id
    FROM topic_glossary
    ORDER BY topic_id, glossary_id
";

$resRel = $connection->query($sqlRel);

if (!$resRel) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "error" => "Database query failed (topic_glossary): " . $connection->error
    ]);
    exit;
}

$topicGlossary = [];
while ($row = mysqli_fetch_assoc($resRel)) {
    $topicGlossary[] = $row;
}

echo json_encode([
    "success" => true,
    "data" => [
        "glossary" => $glossary,
        "topicGlossary" => $topicGlossary
    ]
]);
?>
