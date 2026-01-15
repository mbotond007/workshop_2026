<?php
require_once __DIR__ . '/../../config/connect.php';

header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  http_response_code(405);
  echo json_encode(["success" => false, "error" => "Method not allowed"]);
  exit;
}

// --- honeypot ---
if (!empty($_POST['website'] ?? '')) {
  echo json_encode(["success" => true]); // silently ignore bots
  exit;
}

$message = trim($_POST['message'] ?? '');
$email = trim($_POST['email'] ?? '');

if ($message === '') {
  http_response_code(400);
  echo json_encode(["success" => false, "error" => "Message required"]);
  exit;
}

if (mb_strlen($message) > 3000) {
  http_response_code(400);
  echo json_encode(["success" => false, "error" => "Message too long"]);
  exit;
}

if ($email !== '' && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
  http_response_code(400);
  echo json_encode(["success" => false, "error" => "Invalid email"]);
  exit;
}

$ip = $_SERVER['REMOTE_ADDR'] ?? '';
$user_agent = substr($_SERVER['HTTP_USER_AGENT'] ?? '', 0, 255);

// --- rate limit: max 3 / 10 minutes ---
$limit_stmt = $connection->prepare("
  SELECT COUNT(*) AS cnt
  FROM feedback_messages
  WHERE ip = ?
    AND created_at > (NOW() - INTERVAL 10 MINUTE)
");

$limit_stmt->bind_param("s", $ip);
$limit_stmt->execute();
$limit_stmt->bind_result($cnt);
$limit_stmt->fetch();
$limit_stmt->close();

if ($cnt >= 3) {
  http_response_code(429);
  echo json_encode(["success" => false, "error" => "Rate limit"]);
  exit;
}

// --- insert ---
$stmt = $connection->prepare("
  INSERT INTO feedback_messages (message, email, ip, user_agent)
  VALUES (?, ?, ?, ?)
");

$stmt->bind_param("ssss", $message, $email, $ip, $user_agent);

if (!$stmt->execute()) {
  http_response_code(500);
  echo json_encode(["success" => false, "error" => "Insert failed"]);
  $stmt->close();
  exit;
}

$stmt->close();

echo json_encode(["success" => true]);
