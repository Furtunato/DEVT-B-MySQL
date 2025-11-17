<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = new mysqli("localhost", "root", "0719", "OficinaMecanica");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}


/* ==========================
   1) CLIENTE
   ========================== */

$nome_cliente = $_POST['nome_cliente'] ?? null;
$endereco     = $_POST['endereco_cliente'] ?? null;
$telefone     = $_POST['telefone_cliente'] ?? null;
$email        = $_POST['email_cliente'] ?? null;

$sql = "INSERT INTO Cliente (nome_cliente, endereco, telefone, email)
        VALUES ('$nome_cliente', '$endereco', '$telefone', '$email')";
$conn->query($sql);

$id_cliente = $conn->insert_id;


header("Location: index.html");
exit;

$conn->close();
?>
