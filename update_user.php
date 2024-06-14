<?php
require 'db.php';

$id = $_POST['id'];
$nome = $_POST['nome'];
$cognome = $_POST['cognome'];
$indirizzo = $_POST['indirizzo'];
$dataNascita = $_POST['dataNascita'];
$numeroTelefono = $_POST['numeroTelefono'];
$response = [];

try {
    $sql = "UPDATE Utente SET Nome = ?, Cognome = ?, Indirizzo = ?, Data_nascita = ?, Numero_telefono = ?  WHERE ID_utente = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssi", $nome, $cognome, $indirizzo, $dataNascita, $numeroTelefono, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Utente modificato con successo.";
    } else {
        $response['success'] = false;
        $response['error'] = 'Nessun utente trovato con questo ID o nessuna modifica apportata';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['success'] = false;
    $response['error'] = $e->getMessage();
}


?>
