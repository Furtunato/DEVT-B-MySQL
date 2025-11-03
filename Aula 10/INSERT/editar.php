<?php
$conn = new mysqli("localhost", "root", "senaisp", "livraria");
if ($conn->connect_error) {
  die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET['id_usuario'];

// Preparar
$stmt = $conn->prepare("SELECT * FROM usuarios WHERE id_usuario = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result(); // Obter o resultado
$row = $result->fetch_assoc();

$stmt->close();
$conn->close();
?>

<form action="atualizar.php" method="POST">
    <input type="hidden" name="id" value="<?php echo $row['id_usuario']; ?>">
    Nome: <input type="text" name="nome" value="<?php echo htmlspecialchars($row['nome']); ?>"><br>
    Email: <input type="email" name="email" value="<?php echo htmlspecialchars($row['email']); ?>"><br>
    <input type="submit" value="Atualizar">
</form>