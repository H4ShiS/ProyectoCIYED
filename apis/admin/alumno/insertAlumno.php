<?php 

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Invalid POST request", 400);
    }

    
    $nombre = !empty($_POST['nombre']) ? $_POST['nombre'] : null;
    $apePaterno = !empty($_POST['apePaterno']) ? $_POST['apePaterno'] : null;
    $apeMaterno = !empty($_POST['apeMaterno']) ? $_POST['apeMaterno'] : null;
    $nombreTutor = !empty($_POST['nombretutor']) ? $_POST['nombretutor'] : null;
    $apePaternoTutor = !empty($_POST['appaternotutor']) ? $_POST['appaternotutor'] : null;
    $apeMaternoTutor = !empty($_POST['apmaternotutor']) ? $_POST['apmaternotutor'] : null;
    $telefono = !empty($_POST['telefono']) ? $_POST['telefono'] : null;
    $telOpcional = !empty($_POST['telopcional']) ? $_POST['telopcional'] : null;
    $matricula = !empty($_POST['matricula']) ? $_POST['matricula'] : null;
    $nia = !empty ($_POST['nia']) ? $_POST['nia'] : null;
    $grupo = !empty($_POST['grupo']) ? $_POST['grupo'] : null;
    $semestre = !empty($_POST['semestre']) ? $_POST['semestre'] : null;
    

    // $nombre = "prueba";
    // $apePaterno = "insercion";
    // $apeMaterno = "ALUMNO";
    // $nombreTutor = "ROLANDO";
    // $apePaternoTutor = "CALLES";
    // $apeMaternoTutor = "AGUSTO";
    // $telefono = 324;
    // $telOpcional = "";
    // $matricula = 1234;
    // $nia = 9999;
    // $grupo = 2;
    // $semestre = 3;




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

    $duplicate = "SELECT COUNT(*) as count FROM usuarios WHERE matricula = '$matricula'";
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

    $sql = "INSERT INTO alumnos (nombre, appaterno, apmaterno, nombretutor, apptutor, apmtutor, telefono, telefonoopcional, matricula, nia, id_grupo, id_semestre) 
                VALUES ('$nombre', '$apePaterno', '$apeMaterno', '$nombreTutor', '$apePaternoTutor', '$apeMaternoTutor', '$telefono', '$telOpcional', '$matricula', '$nia', '$grupo', '$semestre')";

    if (!$connect->query($sql)) {
        throw new Exception("Sentencia SQL invalida: (" . $connect->errno . ") " . $connect->error);
    }

    $newUserId = $connect->insert_id;

    if ($newUserId<=0) {
        throw new Exception("Error Interno: Registro Docente Incompleto", 500);     
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