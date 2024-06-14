<?php
require 'db.php';

$id = $_GET['id'];
$response = [];

try {
    $sql = "DELETE FROM Prestito WHERE ID_prestito = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        $response['success'] = true;
    } else {
        $response['success'] = false;
        $response['error'] = 'Nessun prestito trovato con questo ID';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['success'] = false;
    $response['error'] = $e->getMessage();
}

header('Content-Type: application/json');
echo json_encode($response);
?>
