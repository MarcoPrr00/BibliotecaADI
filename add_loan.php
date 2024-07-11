<?php
require 'db.php';

$idLibro = $_POST['libroISBN'];
$idUtente = $_POST['utenteId'];
$dataInizio = $_POST['dataInizio'];
$dataScadenza = $_POST['dataScadenza'];

$sql = "INSERT INTO Prestito (ID_utente, ID_libro, Data_inizio, Data_scadenza) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("isss", $idUtente, $idLibro, $dataInizio, $dataScadenza);

if ($stmt->execute()) {
    echo "Prestito creato con successo.";
} else {
    echo "Errore: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
