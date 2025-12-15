<?php
require_once __DIR__ . '/../config/connect.php'; // a saját DB csatlakozásod

header('Content-Type: application/json; charset=utf-8');

try {
    $stmt = $pdo->prepare("
        SELECT 
            category_id,
            category_name_hu,
            sort_order
        FROM category_bar
        ORDER BY sort_order
    ");

    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'success' => true,
        'data' => $rows
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}
