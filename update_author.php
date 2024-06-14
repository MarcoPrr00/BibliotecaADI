<?php
require 'db.php';

$id = $_POST['id'];
$nome = $_POST['nome'];
$cognome = $_POST['cognome'];
$response = [];

try {
    $sql = "UPDATE Autore SET Nome = ?, Cognome = ? WHERE ID_autore = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssi", $nome, $cognome, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Autore modificato con successo";
    } else {
        $response['success'] = false;
        $response['error'] = 'Nessun autore trovato con questo ID o nessuna modifica apportata';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['success'] = false;
    $response['error'] = $e->getMessage();
}

?>
