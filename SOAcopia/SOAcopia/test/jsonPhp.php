<?php
    //header('Content_Type: application/json; charset=UTF-8');
    //json_encode => Convertir un objeto de php en JSON
    $object = new stdClass();
    $object->nombre="Alex";
    $object-> apellido="Lizano";
    $object->edad=20;
    print_r($object);

    $miJson = json_encode($object);
    echo "</br>";
    echo $miJson;
    echo "</br>";
    echo "</br>";
    
    //array simple de php a json
    $colores = array("rojo", "azul","verde");
    print_r($colores);
    echo "</br>";
    $miJson1 = json_encode($colores);
    echo $miJson1;
    echo "</br>";
    echo "</br>";
    
    //array asociativos de php a json
    $arrayAso = array("Nombre"=>"Alex","Apellido"=>"Muñoz");
    print_r($arrayAso);
    //echo var_dump($arrayAso);
    echo "</br>";
    $miJson2 = json_encode($arrayAso, JSON_UNESCAPED_UNICODE);
    echo $miJson2;
    echo "</br>";
    echo "</br>";
    // echo var_dump($miJson2);


    // json_decode => convertir JSON a PHP
    $lista = '{"nombre": "Alex", "Apellido": "Lizano", "edad":20}';
    echo($lista);
    echo "</br>";
    $miPhp = json_decode($lista, JSON_UNESCAPED_UNICODE);
    print_r($miPhp);
    echo $miPhp["nombre"];