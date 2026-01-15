<?php
require_once __DIR__ . '/../../config/connect.php';

header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  http_response_code(405);
  echo json_encode(["success" => false, "error" => "Method not allowed"]);
  exit;
}

$email = trim($_POST['email'] ?? '');
$message = trim($_POST['message'] ?? '');

if ($email === '' || $message === '') {
  http_response_code(400);
  echo json_encode(["success" => false, "error" => "Missing required fields"]);
  exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
  http_response_code(400);
  echo json_encode(["success" => false, "error" => "Invalid email"]);
  exit;
}

// Basic length guard (release-safe)
if (mb_strlen($message) > 5000) {
  http_response_code(400);
  echo json_encode(["success" => false, "error" => "Message too long"]);
  exit;
}

$ip = $_SERVER['REMOTE_ADDR'] ?? '';
$user_agent = substr($_SERVER['HTTP_USER_AGENT'] ?? '', 0, 255);

$stmt = $connection->prepare("
  INSERT INTO contact_messages (email, message, ip, user_agent)
  VALUES (?, ?, ?, ?)
");

if (!$stmt) {
  http_response_code(500);
  echo json_encode(["success" => false, "error" => "Prepare failed: " . $connection->error]);
  exit;
}

$stmt->bind_param("ssss", $email, $message, $ip, $user_agent);

if (!$stmt->execute()) {
  http_response_code(500);
  echo json_encode(["success" => false, "error" => "Execute failed: " . $stmt->error]);
  $stmt->close();
  exit;
}

$insert_id = $stmt->insert_id;
$stmt->close();

echo json_encode([
  "success" => true,
  "data" => ["contact_id" => $insert_id]
]);
