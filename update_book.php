<?php
require 'db.php';

$ID_libro = $_POST['ID_Libro'];
$isbn = $_POST['isbn'];
$titolo = $_POST['titolo'];
$numero_pagine = $_POST['numero_pagine'];
$casa_editrice = $_POST['casa_editrice'];
$quantita = $_POST['quantita'];
$prezzo = $_POST['prezzo'];
$dataInizio = isset($_POST['dataInizio']) ? $_POST['dataInizio'] : null;
$dataFine = isset($_POST['dataFine']) ? $_POST['dataFine'] : null;
$id_autore = $_POST['autore'];
$response = [];

try {
    // Aggiornamento delle informazioni del libro
    if ($dataInizio == null && $dataFine == null){
        $sql = "UPDATE Libro L
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
                JOIN Autore A ON LA.ID_autore = A.ID_autore
                SET L.ISBN = ?, L.Titolo = ?, L.Numero_pagine = ?, L.Casa_editrice = ?, L.quantita = ?, LA.ID_autore = ?, L.prezzo = ?
                WHERE L.ID_libro = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssisiisi", $isbn, $titolo, $numero_pagine, $casa_editrice, $quantita, $id_autore, $prezzo, $ID_libro);
    }else{
        $sql = "UPDATE Libro L
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
                JOIN Autore A ON LA.ID_autore = A.ID_autore
                SET L.ISBN = ?, L.Titolo = ?, L.Numero_pagine = ?, L.Casa_editrice = ?, L.quantita = ?, LA.ID_autore = ?, L.prezzo = ?, L.Data_inizio_prestito = ?, L.Data_fine_prestito = ?
                WHERE L.ID_libro = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssisiisssi", $isbn, $titolo, $numero_pagine, $casa_editrice, $quantita, $id_autore, $prezzo, $dataInizio, $dataFine, $ID_libro);
    }
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "Libro modificato con successo.";
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
