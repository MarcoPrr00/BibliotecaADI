<?php
require 'db.php';

$ID_libro = $_POST['ID_Libro'];
$isbn = $_POST['isbn'];
$titolo = $_POST['titolo'];
$numero_pagine = $_POST['numero_pagine'];
$casa_editrice = $_POST['casa_editrice'];
$quantita = $_POST['quantita'];
$id_categoria = $_POST['categoria'];
$id_autore = $_POST['autore'];
$response = [];

try {
    // Aggiornamento delle informazioni del libro
    $sql = "UPDATE Libro L
            JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
            JOIN Autore A ON LA.ID_autore = A.ID_autore
            JOIN Categoria C ON L.ID_categoria = C.ID_categoria
            SET L.ISBN = ?, L.Titolo = ?, L.Numero_pagine = ?, L.Casa_editrice = ?, L.quantita = ?, LA.ID_autore = ?, L.ID_categoria = ?
            WHERE L.ID_libro = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssisiiii", $isbn, $titolo, $numero_pagine, $casa_editrice, $quantita, $id_autore, $id_categoria, $ID_libro);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Libro aggiunto con successo.";
    } else {
        $response['success'] = false;
        $response['error'] = 'Nessun libro trovato con questo ISBN o nessuna modifica apportata';
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['success'] = false;
    $response['error'] = $e->getMessage();
}

?>
