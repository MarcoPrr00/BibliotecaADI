<?php
require 'db.php';

$nome = $_POST['nome'];
$cognome = $_POST['cognome'];

$sql = "INSERT INTO Autore (Nome, Cognome) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $nome, $cognome);

if ($stmt->execute()) {
    echo "Autore aggiunto con successo.";
} else {
    echo "Errore: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
