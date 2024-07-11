<?php
require 'db.php';

$ID_Libro = $_GET['id'];
$response = [];

try {
    $sql = "SELECT L.ID_libro, L.ISBN, L.Casa_editrice, Numero_pagine, L.quantita, L.Titolo, L.prezzo, CONCAT(A.Nome, ' ', A.Cognome) AS Autore, L.Prestato, L.Data_inizio_prestito, L.Data_fine_prestito, LA.ID_autore, CONCAT(U.Nome, ' ', U.Cognome) AS Utente 
                FROM Libro L 
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro 
                JOIN Autore A ON LA.ID_autore = A.ID_autore 
                LEFT JOIN Utente U ON L.ID_utente = U.ID_utente 
                WHERE L.ID_libro = ?;";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $ID_Libro);
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
