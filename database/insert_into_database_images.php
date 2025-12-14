<?php

// --------------------------------------------------
// 1. DB CONNECTION
// --------------------------------------------------

$connection = new mysqli("localhost", "root", "", "workshop25");

if ($connection->connect_error) {
    die("MySQL connection error: " . $connection->connect_error);
}

$connection->set_charset("utf8mb4");

// --------------------------------------------------
// 2. IMAGE DIRECTORY feltétel-a php a projekt gyökerében van
// --------------------------------------------------

$imageDir = __DIR__ . "/documents/images/";
$baseUrl  = "/documents/images/";

if (!is_dir($imageDir)) {
    die("A documents/images mappa nem található.");
}

// --------------------------------------------------
// 3. SEGÉDFÜGGVÉNYEK
// --------------------------------------------------

function filenameToTitle(string $filename): string
{
    $name = pathinfo($filename, PATHINFO_FILENAME);
    $name = str_replace(['-', '_'], ' ', $name);
    return mb_convert_case($name, MB_CASE_TITLE, "UTF-8");
}

function getMimeType(string $filePath): ?string
{
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime  = finfo_file($finfo, $filePath);
    finfo_close($finfo);
    return $mime;
}

// --------------------------------------------------
// 4. PREPARED STATEMENTS
// --------------------------------------------------

$check = $connection->prepare(
    "SELECT document_id FROM documents WHERE file_url = ?"
);

$insert = $connection->prepare("
    INSERT INTO documents (
        title_hu,
        document_type,
        file_url,
        mime_type,
        file_size_mb,
        is_external
    ) VALUES (?, 'image', ?, ?, ?, 0)
");

// --------------------------------------------------
// 5. DIRECTORY SCAN + INSERT
// --------------------------------------------------

$files = scandir($imageDir);

$inserted = 0;
$skipped  = 0;

foreach ($files as $file) {

    if ($file === '.' || $file === '..') {
        continue;
    }

    $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));

    if (!in_array($ext, ['jpg', 'jpeg', 'png', 'gif'])) {
        continue;
    }

    $filePath = $imageDir . $file;
    $fileUrl  = $baseUrl . $file;

    // DUPLIKÁCIÓ ELLENŐRZÉS
    $check->bind_param("s", $fileUrl);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        echo "Már létezik: $file\n";
        $skipped++;
        continue;
    }

    // METAADATOK
    $titleHu   = filenameToTitle($file);
    $mimeType  = getMimeType($filePath);
    $fileSize  = round(filesize($filePath) / 1024 / 1024, 2);

    // INSERT
    $insert->bind_param(
        "sssd",
        $titleHu,
        $fileUrl,
        $mimeType,
        $fileSize
    );

    $insert->execute();
    $inserted++;

    echo "Importálva: $file\n";
}

// --------------------------------------------------
// 6. CLEANUP
// --------------------------------------------------

$check->close();
$insert->close();
$connection->close();

echo "\nKész.\n";
echo "Beszúrt képek: $inserted\n";
echo "Kihagyott: $skipped\n";
