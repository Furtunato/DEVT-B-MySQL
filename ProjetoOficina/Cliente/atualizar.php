<?php
$conn = new mysqli("localhost", "root", "0719", "OficinaMecanica");

$id        = $_POST['id_cliente'];
$nome      = $_POST['nome_cliente'];
$endereco  = $_POST['endereco_cliente'];
$telefone  = $_POST['telefone_cliente'];
$email     = $_POST['email_cliente'];

$stmt = $conn->prepare("
UPDATE cliente SET 
nome_cliente = ?, 
endereco_cliente = ?, 
telefone_cliente = ?, 
email_cliente = ?
WHERE id_cliente = ?
");

$stmt->bind_param("ssssi", $nome, $endereco, $telefone, $email, $id);

if ($stmt->execute()) {
    header("Location: listar.php");
    exit;
} else {
    echo "Erro: " . $stmt->error;
}
