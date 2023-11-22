<?php

try {

    // if ($_SERVER['REQUEST_METHOD'] !== 'POST') {    
    //     throw new Exception("Error Processing Request", 400);
    // }

    // $id = !empty($_GET['id']) ? $_GET['id'] : null;
    // $nombreMateria = !empty($_POST['nombremateria']) ? $_POST['nombremateria'] : null;
    // $matricula = !empty($_POST['matricula']) ? $_POST['matricula'] : null;
    // $idDocente = !empty($_POST['iddocente']) ? $_POST['iddocente'] : null;
    // $idSemestre = !empty($_POST['idsemestre']) ? $_POST['idsemestre'] : null;


    $id = 9;
    $nombreMateria = "LECTURA";
    $matricula = "KOKOL15426";
    $idDocente = 9;
    $idSemestre = 1;

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

    $sql = "UPDATE materias 
            SET nombre='$nombreMateria', matricula='$matricula', id_usuario='$idDocente', id_semestre='$idSemestre'
            WHERE id=$id";

    // if (!$connect->query($sql)) {
    //     throw new Exception("Sentencia SQL invalida: (" . $connect->errno . ") " . $connect->error);
    // }
     
    //     echo "Actualizado $id";

    if (mysqli_query($connect, $sql)) {
        $httpCode = 204;
        $message = "Materia Actualizado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 204 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);


    } else {
        
        $httpCode = 400;
        $message = "Materia No Actualizado";
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