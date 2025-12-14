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
// 2. CSV FÁJL a php file és a CSV fájl ugyanabban a könyvtárban van: a gyökérkönyvtárban
// --------------------------------------------------

$csvFile = __DIR__ . "/subtopic_documents.csv";

if (!file_exists($csvFile)) {
    die("A subtopic_documents.csv fájl nem található.");
}

// --------------------------------------------------
// 3. PREPARED STATEMENTS
// --------------------------------------------------

$checkSubtopic = $connection->prepare(
    "SELECT subtopic_id FROM subtopics WHERE subtopic_id = ?"
);

$checkDocument = $connection->prepare(
    "SELECT document_id FROM documents WHERE document_id = ?"
);

$insert = $connection->prepare(
    "INSERT IGNORE INTO subtopic_documents (subtopic_id, document_id)
     VALUES (?, ?)"
);

// --------------------------------------------------
// 4. CSV BEOLVASÁS ÉS INSERT
// --------------------------------------------------

$handle = fopen($csvFile, "r");

if (!$handle) {
    die("Nem sikerült megnyitni a CSV fájlt.");
}

$rowNumber = 0;
$inserted  = 0;
$skipped   = 0;

while (($row = fgetcsv($handle, 0, ";")) !== false) {

    $rowNumber++;

    // fejléc kihagyása
    if ($rowNumber === 1 && strtolower($row[0]) === "subtopic_id") {
        continue;
    }

    if (count($row) < 2) {
        $skipped++;
        continue;
    }

    $subtopicId = (int)$row[0];
    $documentId = (int)$row[1];

    if ($subtopicId <= 0 || $documentId <= 0) {
        $skipped++;
        continue;
    }

    // subtopic létezik?
    $checkSubtopic->bind_param("i", $subtopicId);
    $checkSubtopic->execute();
    $checkSubtopic->store_result();

    if ($checkSubtopic->num_rows === 0) {
        echo "Nincs ilyen subtopic_id: $subtopicId\n";
        $skipped++;
        continue;
    }

    // document létezik?
    $checkDocument->bind_param("i", $documentId);
    $checkDocument->execute();
    $checkDocument->store_result();

    if ($checkDocument->num_rows === 0) {
        echo "Nincs ilyen document_id: $documentId\n";
        $skipped++;
        continue;
    }

    // INSERT (IGNORE a duplikációk miatt)
    $insert->bind_param("ii", $subtopicId, $documentId);
    $insert->execute();

    if ($insert->affected_rows > 0) {
        $inserted++;
    } else {
        $skipped++;
    }
}

fclose($handle);

$checkSubtopic->close();
$checkDocument->close();
$insert->close();
$connection->close();

// --------------------------------------------------
// 5. ÖSSZEFOGLALÁS
// --------------------------------------------------

echo "Import kész.\n";
echo "Beszúrt rekordok: $inserted\n";
echo "Kihagyott sorok: $skipped\n";
