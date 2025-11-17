<?php
$conn = new mysqli("localhost", "root", "0719", "OficinaMecanica");

if ($conn->connect_error) {
    die("Erro: " . $conn->connect_error);
}

$sql = "SELECT * FROM cliente";
$result = $conn->query($sql);
?>

<h2>Clientes cadastrados</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Endereço</th>
        <th>Telefone</th>
        <th>Email</th>
        <th>Ações</th>
    </tr>

<?php while ($row = $result->fetch_assoc()) { ?>
    <tr>
        <td><?= $row['id_cliente'] ?></td>
        <td><?= $row['nome_cliente'] ?></td>
        <td><?= $row['endereco_cliente'] ?></td>
        <td><?= $row['telefone_cliente'] ?></td>
        <td><?= $row['email_cliente'] ?></td>

        <td>
            <a href="editar_cliente.php?id=<?= $row['id_cliente'] ?>">Editar</a> |
            <a href="excluir_cliente.php?id=<?= $row['id_cliente'] ?>">Excluir</a>
        </td>
    </tr>
<?php } ?>

</table>
