<?php
require 'db.php';

$ISBN = $_POST['libroISBN'];
$idUtente = $_POST['utenteId'];
$dataInizio = $_POST['dataInizio'];
$dataScadenza = $_POST['dataScadenza'];

$sql = "INSERT INTO Prestito (ID_utente, ISBN, Data_inizio, Data_scadenza) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("isss", $idUtente, $ISBN, $dataInizio, $dataScadenza);

if ($stmt->execute()) {
    echo "Prestito creato con successo.";
} else {
    echo "Errore: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
