<?php
$conn = new mysqli("localhost", "root", "senaisp", "livraria");
if ($conn->connect_error) {
  die("Erro de conexão: " . $conn->connect_error);
}

$id = $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['email'];

// Preparar
$stmt = $conn->prepare("UPDATE usuarios SET nome=?, email=? WHERE id_usuario=?");
// Vincular parâmetros (string, string, inteiro)
$stmt->bind_param("ssi", $nome, $email, $id);

// Executar
if ($stmt->execute()) {
    echo "Dados atualizados com sucesso!";
    echo "<br><a href='listar.php'>Voltar</a>"; // Corrigido para listar.php
} else {
    echo "Erro: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>