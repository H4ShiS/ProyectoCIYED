<?php 

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Invalid POST request", 400);
    }

    $matricula = !empty($_POST['matricula']) ? $_POST['matricula'] : null;
    $nombre = !empty($_POST['nombre']) ? $_POST['nombre'] : null;
    $apePaterno = !empty($_POST['apePaterno']) ? $_POST['apePaterno'] : null;
    $apeMaterno = !empty($_POST['apeMaterno']) ? $_POST['apeMaterno'] : null;
    $email = !empty($_POST['email']) ? $_POST['email'] : null;
    $pass = !empty($_POST['pass']) ? $_POST['pass'] : null;
    $recado = !empty($_POST['recado']) ? $_POST['recado'] : null;

    // $matricula = 1234;
    // $nombre = "prueba";
    // $apePaterno = "insercion";
    // $apeMaterno = "datos";
    // $email = "docente";
    // $pass = "hola";
    // $recado = "";

    if (is_null($matricula)) {
        throw new Exception('Parametro Matricula requerido ', 400);
    }

    if (is_null($nombre)) {
        throw new Exception('Parametro Nombre requerido ', 400);
    }

    if (is_null($apePaterno)) {
        throw new Exception('Parametro Apellido Paterno Requerido', 400);
    }
    
    if (is_null($apeMaterno)) {
        throw new Exception('Parametro Apellido Materno Requerido', 400);
    }

    if (is_null($email)) {
        throw new Exception('Parametro Correo Requerido', 400);
    }

    if (is_null($pass)) {
        throw new Exception('Parametro Contraseña Requerido', 400);
    }

    require_once('../bd/conexionBd.php');

    $sql = "INSERT INTO docentesregistro (matricula, nombre, appaterno, apmaterno, email, contraseña, recado) 
                VALUES ('$matricula', '$nombre', '$apePaterno', '$apeMaterno', '$email', '$pass', '$recado')";

    if (!$connect->query($sql)) {
        throw new Exception("Sentencia SQL invalida: (" . $connect->errno . ") " . $connect->error);
    }

    $newUserId = $connect->insert_id;

    if ($newUserId<=0) {
        throw new Exception("Error Interno: Registro Docente Icnompleto", 500);     
    }

    $httpCode = 200;
    // $message = "Registro Exitoso: {$newUserId}";
    $message = "Docente Registrado con Exito ";
    header('Content-Type: application/json; charset=utf-8');
    header("HTTP/1.1 200 OK"); 
    echo json_encode(['httpCode' => $httpCode, 'message' => $message], true);

} catch (Exception $e) {
    
    $httpCode = $e->getCode();
    $message = $e->getMessage();
    header('Content-Type: application/json; charset=utf-8');

    $json = json_encode(['httpCode' => $httpCode,'mensaje' => $message], true);
    echo $json;

}
?>