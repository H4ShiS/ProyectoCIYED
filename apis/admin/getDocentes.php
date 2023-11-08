<?php 

try {

    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception('Error: Request method', 400);
    }

    require_once('../bd/conexionBd.php');

    $sql = "SELECT * FROM usuarios";
    $res = mysqli_query($connect, $sql);

    if ($res) {
        if ($res && mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_array($res)) {
                $data[] = $row;
            }

            

            $httpCode = 200;
            $message = "OK";
            header('Content-Type: application/json; charset=utf-8');
            header("HTTP/1.1 200 OK");
            echo json_encode(["httCode" => $httpCode, "message" => $message], true);

            json_encode($data); 
            print_r($data);

        } else {
            $httpCode = 400;
            $message = "Tabla BD vacia";
            header('Content-Type: application/json; charset=utf-8');
            header("HTTP/1.1 400 Bad Request");
            json_encode(["httpCode"=> $httpCode, "message"=>$message], true);
        }
        
    } else {
        $httpCode = 400;
        $message = "Tabla BD vacia";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 400 Bad Request");
        echo json_encode(["httpCode"=> $httpCode,"message"=>$message], true);
    }

} catch (Exception $e) {
    
    $httpCode = $e->getCode();
    $message = $e->getMessage();
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['httpCode' => $httpCode,'mensaje' => $message], true);
    
}
?>