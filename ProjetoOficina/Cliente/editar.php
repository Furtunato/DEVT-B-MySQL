<?php
$conn = new mysqli("localhost", "root", "0719", "OficinaMecanica");

$id = $_GET['id'];

$stmt = $conn->prepare("SELECT * FROM cliente WHERE id_cliente = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
?>

<h2>Editar Cliente</h2>

<form action="atualizar_cliente.php" method="POST">

    <input type="hidden" name="id_cliente" value="<?= $row['id_cliente'] ?>">

    Nome:  
    <input type="text" name="nome_cliente" value="<?= $row['nome_cliente'] ?>" required><br><br>

    Endereço:  
    <input type="text" name="endereco_cliente" value="<?= $row['endereco_cliente'] ?>" required><br><br>

    Telefone:  
    <input type="text" name="telefone_cliente" value="<?= $row['telefone_cliente'] ?>" required><br><br>

    Email:  
    <input type="email" name="email_cliente" value="<?= $row['email_cliente'] ?>" required><br><br>

    <button type="submit">Atualizar</button>

</form>
