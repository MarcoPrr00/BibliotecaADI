<?php
require 'db.php';

$nome = $_POST['nome'];
$cognome = $_POST['cognome'];
$indirizzo = $_POST['indirizzo'];
$data_nascita = $_POST['data_nascita'];
$numero_telefono = $_POST['numero_telefono'];

$sql = "INSERT INTO Utente (Nome, Cognome, Indirizzo, Data_nascita, Numero_telefono) VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $nome, $cognome, $indirizzo, $data_nascita, $numero_telefono);

if ($stmt->execute()) {
    echo "Utente aggiunto con successo.";
} else {
    echo "Errore: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
