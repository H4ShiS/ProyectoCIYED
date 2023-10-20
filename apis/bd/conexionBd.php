<?php
  
  try {
    $host_name = 'localhost';
    $user_name = 'id21401696_pruebas1826';
    $password = 'Pruebas1800@!!!';
    $database = 'id21401696_conexionxd';
  
    $connect = new mysqli($host_name, $user_name,$password, $database);

    if ($connect->connect_errno) {
      throw new Exception("Error de Conexionxd: " . $connect->connect_errno, 503);
    }
    
  } catch (Exception $e) {

    $httpCode = $e->getCode();
    $message = $e->getMessage(); 
    header('Content-Type: application/json; charset=utf-8');

    $json = json_encode(['httpCode' => $httpCode,'mensaje' => $message], true);
    echo $json;

  }
?>