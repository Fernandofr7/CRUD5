<?php
include_once '../model/consulta.php';
include_once '../model/borrar.php';
include_once '../model/guardar.php';
include_once '../model/actualizar.php';

header('Content-Type: application/json');

$opc= $_SERVER['REQUEST_METHOD'];
switch($opc){
    case 'GET':
            crudS::SeleccionarEstudiantes();
        
        break;
    case 'POST':
        $datoG = json_decode(file_get_contents('php://input'));
            crudG::guardarEstudiante($datoG -> cedula,$datoG -> nombre,$datoG -> apellido,$datoG -> direccion,
            $datoG -> telefono);
        break;
    case 'DELETE':
        $cedula =$_GET['cedula'];
        CrudE::eliminarEstudiante($cedula);
        break;
    case 'PUT':
        $data = json_decode(file_get_contents("php://input"), true);
        $ced = $data['cedula'];
        $nom = $data['nombre'];
        $ape = $data['apellido'];
        $dir = $data['direccion'];
        $tel = $data['telefono'];
        CrudM::modificarEstudiante($ced, $nom, $ape, $dir, $tel);
        break;
}