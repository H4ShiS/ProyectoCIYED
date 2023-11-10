<?php

try {

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {    
        throw new Exception("Error Processing Request", 400);
    }

    $id = !empty($_GET['id']) ? $_GET['id'] : null;
    $matricula = !empty($_POST['matricula']) ? $_POST['matricula'] : null;
    $nombre = !empty($_POST['nombre']) ? $_POST['nombre'] : null;
    $appaterno = !empty($_POST['apePaterno']) ? $_POST['apePaterno'] : null;
    $appmaterno = !empty($_POST['apeMaterno']) ? $_POST['apeMaterno'] : null;
    $correo = !empty($_POST['email']) ? $_POST['email'] : null;
    $pass = !empty($_POST['pass']) ? $_POST['pass'] : null;
    $recado = !empty($_POST['recado']) ? $_POST['recado'] : null;


    // $id = 9;
    // $matricula =  "1523";
    // $nombre =  "hola" ;
    // $appaterno = "como";
    // $apmaterno = "3ff";  
    // $correo =  "prueba@gmail.com";
    // $pass = "1523";
    // $recado = "hola"; 

    if (is_null($matricula)) {
        throw new Exception("Parametro matricula vacio", 400);
    }
    if (is_null($nombre)) {
        throw new Exception("Parametro nombre Vacio", 400);
    }
    if (is_null($appaterno)) {
        throw new Exception("Parametro Apellido Paterno vacio", 400);
    }
    if (is_null($apmaterno)) {
        throw new Exception("Parametro Apellido Materno vacio", 400);
    }
    if (is_null($correo)) {
        throw new Exception("Parametro Email Vacio", 400);
    }
    if (is_null($pass)) {
        throw new Exception("Parametro Contraseña vacio", 400);
    }
    if (is_null($recado)) {
        throw new Exception("Parametro Recordatorio vacio", 400);
    }

    require_once('../bd/conexionBd.php');

    $sql = "UPDATE usuarios 
            SET nombre='$nombre', appaterno='$appaterno', apmaterno='$apmaterno', email='$correo', contrasena='$pass', matricula ='$matricula', recordatorio='$recado' 
            WHERE id=9";

    // if (!$connect->query($sql)) {
    //     throw new Exception("Sentencia SQL invalida: (" . $connect->errno . ") " . $connect->error);
    // }
     
    //     echo "Actualizado $id";

    if (mysqli_query($connect, $sql)) {
        $httpCode = 204;
        $message = "Docente Actualizado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 204 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);


    } else {
        
        $httpCode = 400;
        $message = "Docente No Actualizado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 400 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);
    }
    
    
    
} catch (Exception $e) {
    $httpCode = $e->getCode();
    $message = $e->getMessage();

    header('Content-Type: application/json; charset=utf-8');
    
    $json = json_encode(["Message" => $message, "httpCode" => $httpCode,], true);
    echo $json;
}


?>