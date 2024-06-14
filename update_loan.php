<?php
require 'db.php';

$id = $_POST['id'];
$utente = $_POST['utente'];
$libro = $_POST['libro'];
$dataInizio = $_POST['dataInizio'];
$dataFine = $_POST['dataFine'];
$dataRestituzione = $_POST['dataRestituzione'];
$response = [];

try {
    $sql = "UPDATE Prestito SET Data_inizio = ?, Data_scadenza = ?, Data_restituzione = ? WHERE ID_prestito = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssi",$dataInizio, $dataFine, $dataRestituzione, $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Prestito modificato con successo.";
    } else {
        $response['success'] = false;
        $response['error'] = 'Nessun prestito trovato con questo ID o nessuna modifica apportata';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['success'] = false;
    $response['error'] = $e->getMessage();
}

?>
