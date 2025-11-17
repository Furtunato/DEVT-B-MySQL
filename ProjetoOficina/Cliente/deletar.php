<?php
$conn = new mysqli("localhost", "root", "0719", "OficinaMecanica");

$id = $_GET['id'];

$stmt = $conn->prepare("DELETE FROM cliente WHERE id_cliente = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: listar.php");
exit;
?>
