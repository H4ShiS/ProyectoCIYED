<?php

try {
    
    if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
        throw new Exception('Error Request Method', 400);
    }
    // $id = !empty($_GET['id']) ? $_GET['id'] : null;
    $id = 3;

    require_once('../../bd/conexionBd.php');

    $sql = "DELETE FROM usuarios WHERE id=$id";

    if ($connect->query($sql)) {
        echo"Docente Eliminado";
    } else {
        echo "Error al eliminar Docente";
    }
    
    $connect->close();

} catch (Exception $th) {

    $httpCode = $e->getCode();
    $message = $e->getMessage();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['httpCode' => $httpCode,'mensaje' => $message], true);

}

?>