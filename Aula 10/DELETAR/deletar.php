<?php
$conn = new mysqli("localhost", "root", "senaisp", "livraria");
if ($conn->connect_error) {
  die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET['id_usuarios'];

// Preparar a declaração
$stmt = $conn->prepare("DELETE FROM usuarios WHERE id_usuarios = ?");
// Vincular o parâmetro 'id' como um inteiro (i)
$stmt->bind_param("i", $id);

// Executar e verificar
if ($stmt->execute()) {
  echo "Usuário deletado com sucesso!";
} else {
  echo "Erro ao deletar: " . $stmt->error;
}
echo "<br><a href='listar.php'>Voltar para a lista</a>";

$stmt->close();
$conn->close();
?>