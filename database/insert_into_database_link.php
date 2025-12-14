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
// 2. CSV FÁJL a bookmarks.csv és az insert_into_database_link.php ugyanabban a könyvtárban legyen: a gyökérkönyvtárban
// --------------------------------------------------

$csvFile = __DIR__ . "/bookmarks.csv";

if (!file_exists($csvFile)) {
    die("A bookmarks.csv fájl nem található.");
}

// --------------------------------------------------
// 3. PREPARED STATEMENT
// --------------------------------------------------

$insert = $connection->prepare("
    INSERT INTO documents (
        title_hu,
        document_type,
        file_url,
        is_external
    ) VALUES (?, 'link', ?, 1)
");

// --------------------------------------------------
// 4. CSV BEOLVASÁS
// --------------------------------------------------

$handle = fopen($csvFile, "r");

if (!$handle) {
    die("Nem sikerült megnyitni a CSV fájlt.");
}

$rowNumber = 0;

while (($row = fgetcsv($handle, 0, ";")) !== false) {

    $rowNumber++;

    // üres vagy hibás sor
    if (count($row) < 2) {
        continue;
    }

    $fileUrl = trim($row[0]);
    $titleHu = trim($row[1]);
    

    // fejléc kihagyása (ha van)
    if ($rowNumber === 1 && strtolower($titleHu) === "title_hu") {
        continue;
    }

    if ($titleHu === "" || $fileUrl === "") {
        continue;
    }

    // DUPLIKÁCIÓ ELLENŐRZÉS
    $check = $connection->prepare(
        "SELECT document_id FROM documents WHERE file_url = ?"
    );
    $check->bind_param("s", $fileUrl);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        $check->close();
        echo "Már létezik: $fileUrl\n";
        continue;
    }
    $check->close();

    // INSERT
    $insert->bind_param("ss", $titleHu, $fileUrl);
    $insert->execute();

    echo "Importálva: $titleHu\n";
}

fclose($handle);

$insert->close();
$connection->close();

echo "Link import kész.\n";
