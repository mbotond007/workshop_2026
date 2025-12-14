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
// 2. PDF KÖNYVTÁR feltétel-a php a projekt gyökerében van
// --------------------------------------------------

$pdfDir = __DIR__ . "/documents/pdf/";
$baseUrl = "/documents/pdf/";

// --------------------------------------------------
// 3. SEGÉDFÜGGVÉNY: fájlnév → cím
// --------------------------------------------------

function filenameToTitle(string $filename): string
{
    $name = pathinfo($filename, PATHINFO_FILENAME);
    $name = str_replace('-', ' ', $name);
    return mb_convert_case($name, MB_CASE_TITLE, "UTF-8");
}

// --------------------------------------------------
// 4. KÖNYVTÁR BEJÁRÁSA
// --------------------------------------------------

$files = scandir($pdfDir);

$stmt = $connection->prepare("
    INSERT INTO documents (
        title_hu,
        document_type,
        file_url,
        mime_type,
        file_size_mb,
        is_external
    ) VALUES (?, 'pdf', ?, 'application/pdf', ?, 0)
");

foreach ($files as $file) {

    if (pathinfo($file, PATHINFO_EXTENSION) !== 'pdf') {
        continue;
    }

    $filePath = $pdfDir . $file;
    $fileUrl  = $baseUrl . $file;

    // fájlméret MB-ban
    $fileSizeMb = round(filesize($filePath) / 1024 / 1024, 2);

    // cím generálása
    $titleHu = filenameToTitle($file);

    // DUPLIKÁCIÓ ELLENŐRZÉS (file_url alapján)
    $check = $connection->prepare(
        "SELECT document_id FROM documents WHERE file_url = ?"
    );
    $check->bind_param("s", $fileUrl);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        $check->close();
        echo "Már létezik: $file\n";
        continue;
    }
    $check->close();

    // INSERT
    $stmt->bind_param("ssd", $titleHu, $fileUrl, $fileSizeMb);
    $stmt->execute();

    echo "Importálva: $file\n";
}

$stmt->close();
$connection->close();

echo "PDF import kész.\n";
