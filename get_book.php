<?php
require 'db.php';

$isbn = $_GET['isbn'];
$response = [];

try {
    $sql = "SELECT L.ID_libro, L.ISBN, L.quantita, L.Titolo, L.Numero_pagine, L.Casa_editrice, CONCAT(A.Nome, ' ', A.Cognome) AS Autore, C.Descrizione AS Categoria, A.ID_autore, C.ID_categoria
                FROM Libro L 
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
                JOIN Autore A ON LA.ID_autore = A.ID_autore
                JOIN Categoria C ON L.ID_categoria = C.ID_categoria
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
