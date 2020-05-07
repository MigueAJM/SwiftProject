<?php
/*
 * El siguiente código Inserta un usuario
 * Stark Abril/2020
 */
$response = array();
$usuario = array();
$Cn = mysqli_connect("localhost", "root", "", "securityapp") or die("server no encontrado");
mysqli_set_charset($Cn, "utf8");
// Checa que le este llegando por el método POST el nomProd,existencia y precio
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $objArray = json_decode(file_get_contents("php://input"), true);
    if (empty($objArray)) {
        // required field is missing
        $usuario["success"] = 400;
        $usuario["message"] = "Faltan Datos entrada";
        array_push($response, $usuario);
        echo json_encode($response);
    } else {
        $foto = $objArray['foto'];
        $nombre = $objArray['nombre'];
        $correo = $objArray['correo'];
        $fechaN = $objArray['fechaNac'];
        $sexo = $objArray['sexo'];
        $telefono = $objArray['telefono'];
       
        $result = mysqli_query($Cn, "INSERT INTO usuarios(foto,nombre,correo,fechaNac,sexo,telefono) values
         ('$foto','$nombre','$correo',$fechaN,'$sexo','$telefono')");
        //$idprod = mysqli_insert_id($Cn);
        if ($result) {
            $usuario["success"] = 200; // El success=200 es que encontro eñ usuario
            $usuario["message"] = "usuario Insertado";
            array_push($response, $usuario);
            echo json_encode($response);
        } else {
            //
            $usuario["success"] = 406;
            $usuario["message"] = "usuario no Insertado";
            array_push($response, $usuario);
            echo json_encode($response);
        }
    }
} else {
    // required field is missing
    $usuario["success"] = 400;
    $usuario["message"] = "Faltan Datos entrada";
    array_push($response, $usuario);
    echo json_encode($response);
}
mysqli_close($Cn);
