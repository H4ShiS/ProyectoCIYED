<?php

try {
    
    if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
        throw new Exception('Error Request Method', 400);
    }
    $id = !empty($_GET['id']) ? $_GET['id'] : null;
    // $id = 3;

    require_once('../../bd/conexionBd.php');

    $sql = "DELETE FROM usuarios WHERE id=$id";

    if ($connect->query($sql)) {

        $httpCode = 200;
        $message = "Docente Eliminado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 200 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);

    } else {

        $httpCode = 204;
        $message = "Docente No Eliminado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 204 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);
    }
    
    $connect->close();

} catch (Exception $e) {

    $httpCode = $e->getCode();
    $message = $e->getMessage();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['httpCode' => $httpCode,'mensaje' => $message], true);

}

?>