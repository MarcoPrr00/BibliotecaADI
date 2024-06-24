<?php
require 'db.php';

$isbn = $_GET['isbn'];
$response = [];

try {
    $sql = "SELECT L.ID_libro, L.ISBN, L.Casa_editrice, Numero_pagine, L.quantita, L.Titolo, L.prezzo, CONCAT(A.Nome, ' ', A.Cognome) AS Autore, L.Prestato, L.Data_inizio_prestito, L.Data_fine_prestito 
                FROM Libro L 
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
                JOIN Autore A ON LA.ID_autore = A.ID_autore
                WHERE L.ISBN = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $isbn);
    $stmt->execute();
    $result = $stmt->get_result();
    $response = $result->fetch_assoc();

    if (!$response) {
        $response['error'] = 'Nessun libro trovato con questo ISBN';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['error'] = $e->getMessage();
}

header('Content-Type: application/json');
echo json_encode($response);
?>
