<?php 

try {
    // if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    //     throw new Exception("Invalid POST request", 400);
    // }

    // $id = !empty($_GET['id']) ? $_GET['id'] : null;
    // $nombre = !empty($_POST['nombre']) ? $_POST['nombre'] : null;
    // $apePaterno = !empty($_POST['apePaterno']) ? $_POST['apePaterno'] : null;
    // $apeMaterno = !empty($_POST['apeMaterno']) ? $_POST['apeMaterno'] : null;
    // $nombreTutor = !empty($_POST['nombretutor']) ? $_POST['nombretutor'] : null;
    // $apePaternoTutor = !empty($_POST['appaternotutor']) ? $_POST['appaternotutor'] : null;
    // $apeMaternoTutor = !empty($_POST['apmaternotutor']) ? $_POST['apmaternotutor'] : null;
    // $telefono = !empty($_POST['telefono']) ? $_POST['telefono'] : null;
    // $telOpcional = !empty($_POST['telopcional']) ? $_POST['telopcional'] : null;
    // $matricula = !empty($_POST['matricula']) ? $_POST['matricula'] : null;
    // $nia = !empty ($_POST['nia']) ? $_POST['nia'] : null;
    // $grupo = !empty($_POST['grupo']) ? $_POST['grupo'] : null;
    // $semestre = !empty($_POST['semestre']) ? $_POST['semestre'] : null;
    
    $id = 6;
    $nombre = "prueba";
    $apePaterno = "insercion";
    $apeMaterno = "ALUMNO";
    $nombreTutor = "ROLANDO";
    $apePaternoTutor = "CALLES";
    $apeMaternoTutor = "AGUSTO";
    $telefono = 324;
    $telOpcional = null;
    $matricula = 1234;
    $nia = 9999;
    $grupo = 2;
    $semestre = 3;



if (is_null($nombre)) {
        throw new Exception('Parametro Nombre requerido ', 400);
    }
    if (is_null($apePaterno)) {
        throw new Exception('Parametro Apellido Paterno Requerido', 400);
    }
    if (is_null($apeMaterno)) {
        throw new Exception('Parametro Apellido Materno Requerido', 400);
    }
 
    if (is_null($nombreTutor)) {
        throw new Exception('Parametro Nombre Tutor Requerido', 400);
    }
    if (is_null($apePaternoTutor)) {
        throw new Exception('Parametro Apellido Paterno Tutor Requerido', 400);
    }
    if (is_null($apeMaternoTutor)) {
        throw new Exception('Parametro Nombre Apellido Materno Requerido', 400);
    }
    if (is_null($telefono)) {
        throw new Exception('Parametro Telefono Tutor Requerido', 400);
    }
    if (is_null($matricula)) {
        throw new Exception('Parametro Matricula requerido ', 400);
    }
    if (is_null($nia)) {
        throw new Exception('Parametro NIA requerido ', 400);
    }
    if (is_null($grupo)) {
        throw new Exception('Parametro Apellido Materno Requerido', 400);
    }
    if (is_null($semestre)) {
        throw new Exception('Parametro Semestre Requerido', 400);
    }
    
    require_once('../../bd/conexionBd.php');

    $duplicate = "SELECT COUNT(*) as count FROM alumnos WHERE matricula = '$matricula'";
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

    $sql = "UPDATE  alumnos 
                SET nombre='$nombre', appaterno='$apePaterno', apmaterno='$apeMaterno', nombretutor='$nombreTutor', apptutor='$apePaternoTutor', apmtutor='$apeMaternoTutor', 
                telefono='$telefono', telefonoopcional='$telOpcional', matricula='$matricula', nia='$nia', id_grupo='$grupo', id_semestre='$semestre' WHERE id = $id";

    if (mysqli_query($connect, $sql)) {
        $httpCode = 204;
        $message = "Alumno Actualizado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 204 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);


    } else {
        
        $httpCode = 400;
        $message = "Alumno No Actualizado";
        header('Content-Type: application/json; charset=utf-8');
        header("HTTP/1.1 400 OK"); 
        echo json_encode(['httpCode' => $httpCode,'message' => $message], true);
    }


} catch (Exception $e) {
    
    $httpCode = $e->getCode();
    $message = $e->getMessage();
    header('Content-Type: application/json; charset=utf-8');
    $json = json_encode(['httpCode' => $httpCode,'mensaje' => $message], true);
    echo $json;

}
?>