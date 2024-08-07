<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require 'db.php';

header('Content-Type: application/json');

$type = $_GET['type'];
$data = [];

try {

switch ($type) {
    case 'categorie':
        $sql = "SELECT ID_categoria, Descrizione FROM Categoria";
        break;
    case 'autori':
        $sql = "SELECT ID_autore, Nome, Cognome FROM Autore ORDER BY Nome, Cognome";
        break;
    case 'utenti':
        $sql = "SELECT ID_utente, Nome, Cognome, Indirizzo, Data_nascita, Numero_telefono FROM Utente";
        break;
    case 'libri':
        
        $sql = "SELECT L.ID_libro, L.ISBN, L.quantita, L.Titolo, L.prezzo, CONCAT(A.Nome, ' ', A.Cognome) AS Autore, L.Prestato, L.Data_inizio_prestito, L.Data_fine_prestito, DATEDIFF(L.Data_fine_prestito,current_date) AS Giorni_Rimasti
                FROM Libro L 
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
                JOIN Autore A ON LA.ID_autore = A.ID_autore ORDER BY L.Titolo";
        break;
    case 'prestiti':
        $sql = "SELECT P.ID_prestito, CONCAT(U.Nome, ' ', U.Cognome) AS Utente, P.ID_libro, L.Titolo, P.Data_inizio, P.Data_scadenza, P.Data_restituzione, DATEDIFF(P.Data_scadenza,current_date) AS Giorni_Rimasti 
                FROM Prestito P 
                JOIN Utente U ON P.ID_utente = U.ID_utente
                JOIN Libro L ON P.ID_libro = L.ID_libro
                WHERE Data_restituzione IS NULL
                ORDER BY P.Data_inizio DESC";
        break;
    case 'CronologiaPrestiti':
        $sql = "SELECT P.ID_prestito, CONCAT(U.Nome, ' ', U.Cognome) AS Utente, P.ID_libro, L.Titolo, P.Data_inizio, P.Data_scadenza, P.Data_restituzione, DATEDIFF(P.Data_scadenza,current_date) AS Giorni_Rimasti 
                FROM Prestito P 
                JOIN Utente U ON P.ID_utente = U.ID_utente
                JOIN Libro L ON P.ID_libro = L.ID_libro
                WHERE Data_restituzione IS NOT NULL
                ORDER BY P.Data_inizio DESC";
        break;
    case 'search_books':
        $query = $_GET['query'];
        $sql = "SELECT L.ID_libro, L.ISBN, L.quantita, L.Titolo, L.prezzo, CONCAT(A.Nome, ' ', A.Cognome) AS Autore, L.Prestato, L.Data_inizio_prestito, L.Data_fine_prestito 
                FROM Libro L 
                JOIN LibroAutore LA ON L.ID_libro = LA.ID_libro
                JOIN Autore A ON LA.ID_autore = A.ID_autore
                WHERE L.Titolo LIKE ? OR CONCAT(A.Nome, ' ', A.Cognome) LIKE ?";
        break;
    default:
        echo json_encode([]);
        exit();
}

$stmt = $conn->prepare($sql);

if ($type === 'search_books') {
    $search = "%$query%";
    $stmt->bind_param("ss", $search, $search);
}

$stmt->execute();
$result = $stmt->get_result();
$data = $result->fetch_all(MYSQLI_ASSOC);

echo json_encode($data);

$stmt->close();
$conn->close();
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>
