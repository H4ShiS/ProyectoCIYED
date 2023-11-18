<?php 

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Invalid POST request", 400);
    }

    $matricula = !empty($_POST['matricula']) ? $_POST['matricula'] : null;
    $nombreMateria = !empty($_POST['nombremateria']) ? $_POST['nombremateria'] : null;
    $idDocente = !empty($_POST['iddocente']) ? $_POST['iddocente'] : null;
    $idSemestre = !empty($_POST['idsemestre']) ? $_POST['idsemestre'] : null;
    // $nombreMateria = "FISICA";
    // $matricula = 123456;
    // $idDocente = 8;
    // $idSemestre = 1;

    if (is_null($matricula)){
        throw new Exception("Parametro Matricula requerido", 400);     
    }
    if (is_null($nombreMateria)) {
        throw new Exception("Parametro Nombre de la Materia requerido", 400);     
    }
    if (is_null($idDocente)) {
        throw new Exception("Parametro Docente requerido", 400);     
    }
    if (is_null($idSemestre)) {
        throw new Exception("Parametro Semestre requerido", 400);     
    }

    require_once('../../bd/conexionBd.php');

    $duplicate = "SELECT COUNT(*) as count FROM materias WHERE matricula = '$matricula'";
    $resul = $connect->query($duplicate);

    if ($resul && $resul->num_rows > 0) {
        $row = $resul->fetch_assoc();
        $count = $row['count'];
        if ($count > 0) {
            $httpCode = 409;
            $message = "Matricula Duplicado";
            header('Content-Type: application/json; charset=utf-8');
            header("HTTP/1.1 409 Conflict");
            echo json_encode(['httpCode' => $httpCode,'message' => $message], true);
            exit();
        }

    }

    $sql = "INSERT INTO materias (nombre, matricula, id_usuario, id_semestre) VALUES ('$nombreMateria','$matricula', '$idDocente', '$idSemestre')";

    if (!$connect->query($sql)) {
        throw new Exception("Sentencia SQL invalida: (" . $connect->errno . ") " . $connect->error);
    }

    $newUserId = $connect->insert_id;

    if ($newUserId<=0) {
        throw new Exception("Error Interno: Registro Materia Incompleto", 500);     
    }

    $httpCode = 200;
    // $message = "Registro Exitoso: {$newUserId}";
    $message = "Materia Registrada con Exito ";
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

