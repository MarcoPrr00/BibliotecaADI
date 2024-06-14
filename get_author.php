<?php
require 'db.php';

$id = $_GET['id'];
$response = [];

try {
    $sql = "SELECT * FROM Autore WHERE ID_autore = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $response = $result->fetch_assoc();
    } else {
        $response['error'] = 'Nessun autore trovato con questo ID';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['error'] = $e->getMessage();
}

header('Content-Type: application/json');
echo json_encode($response);
?>
