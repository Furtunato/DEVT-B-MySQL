<?php
$nome = $_POST['nome'];
$email = $_POST['email'];

$conn = new mysqli("localhost", "root", "senaisp", "livraria");
if ($conn->connect_error) {
  die("Erro de conexão: " . $conn->connect_error);
}

// Preparar
$stmt = $conn->prepare("INSERT INTO usuarios (nome, email) VALUES (?, ?)");
// Vincular parâmetros como strings (s)
$stmt->bind_param("ss", $nome, $email);

// Executar
if ($stmt->execute()) {
  echo "Dados salvos com sucesso!";
  echo "<br><a href='index.html'>Voltar</a>"; // Adicionei um link de volta
} else {
  echo "Erro: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>