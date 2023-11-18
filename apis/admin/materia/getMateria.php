<?php

try {
    // Si se incluye el parámetro polling en la URL, iniciamos el Long Polling
    

    //validamos que sea de tipo GET la petición 
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception("Invalid GET request", 400);
    }
    if (isset($_GET['polling'])) {
        // Simplemente esperamos por un cierto tiempo antes de responder
        sleep(5); //  tiempo de espera segun lo que se necesite para hacer nuevamente la petición

        $httpCode = 200;
        $message = "Ninguna actualización disponible";

        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 200 OK");
        echo json_encode(['httpCode' => $httpCode, 'message' => $message], true);
        exit();
    }

    require_once('../../bd/conexionBd.php');

    $sql = "SELECT * FROM materias";
    $result = $connect->query($sql);

    if ($result && $result->num_rows > 0) {
        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        $httpCode = 200;
        $message = "OK";

        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 200 OK");
        echo json_encode(['httpCode' => $httpCode, 'message' => $message, 'data' => $data], true);
    } else {
        $httpCode = 400;
        $message = "Tabla BD vacía";

        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 400 Bad Request");
        echo json_encode(['httpCode' => $httpCode, 'message' => $message], true);
    }

} catch (Exception $e) {
    //manejo de excepción
    $httpCode = $e->getCode();
    $message = $e->getMessage();

    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['httpCode' => $httpCode, 'message' => $message], true);
}

?>
