<?php

class crudS{
    public static function seleccionarEstudiantes(){
        include_once 'conexion.php';
        $object = new conexion();
        $conn = $object->conectar();
        $sqlSelect= "select * from estudiante";
        $result = $conn->prepare($sqlSelect);
        $result->execute();
        $data =$result->fetchAll(PDO::FETCH_ASSOC);
        $dataJs = json_encode($data);
        print_r($dataJs);
    }

}