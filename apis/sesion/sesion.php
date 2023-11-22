<?php

try {

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Invalid POST request", 400);
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

    $email = !empty($_POST['email']) ? $_POST['email'] : null;
    $pass = !empty($_POST['pass']) ? $_POST['pass'] : null;

    // $correo = "hsksk@gmail.com";
    // $pass = "jjs";

    require_once('../bd/conexionBd.php');

    $sql = "SELECT * FROM usuarios WHERE email='$email' AND contrasena='$pass'";
    $result = $connect->query($sql);

    if ($result && $result->num_rows > 0) {
        $data = array();
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        $httpCode = 200;
        $message = "Inicio se Sesion Correcto";

        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 200 OK");
        // echo json_encode(['httpCode' => $httpCode, 'message' => $message, 'data' => $data], true);
        echo json_encode($data); 

    } else {
        $httpCode = 400;
        $message = "Usuario No encontrado";

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
