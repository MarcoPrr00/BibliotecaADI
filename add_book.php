<?php
require 'db.php';

$isbn = $_POST['isbn'];
$titolo = $_POST['titolo'];
$data_pubblicazione = $_POST['data_pubblicazione'];
$casa_editrice = $_POST['casa_editrice'];
$quantita = $_POST['quantita'];
$id_categoria = $_POST['categoria'];
$id_autore = $_POST['autore'];
$copertina="";

$sql = "INSERT INTO Libro (ISBN, Titolo, Data_pubblicazione, Casa_editrice, copertina, quantita, ID_categoria) VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssssii", $isbn, $titolo, $data_pubblicazione, $casa_editrice, $copertina, $quantita, $id_categoria);

if ($stmt->execute()) {
    $sqlLibro = "SELECT ID_libro FROM Libro WHERE ISBN=\"".$isbn."\"";
    $result = $conn->query($sqlLibro);
    $row = $result->fetch_assoc();
    $id_libro = $row["ID_libro"]; 
    $sql = "INSERT INTO LibroAutore (ID_libro, ID_autore) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $id_libro, $id_autore);
    $stmt->execute();

    echo "Libro aggiunto con successo.";
} else {
    echo "Errore: " . $id_categoria."    ".$stmt->error;
}

$stmt->close();
$conn->close();
?>
