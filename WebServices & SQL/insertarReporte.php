<?php
/*
 * El siguiente código Inserta un reporte
 * Stark Abril/2020
 */
$response = array();
$reporte = array();
$Cn = mysqli_connect("localhost", "root", "", "securityapp") or die("server no encontrado");
mysqli_set_charset($Cn, "utf8");
// Checa que le este llegando por el método POST el nomProd,existencia y precio
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $objArray = json_decode(file_get_contents("php://input"), true);
    if (empty($objArray)) {
        // required field is missing
        $reporte["success"] = 400;
        $reporte["message"] = "Faltan Datos entrada";
        array_push($response, $reporte);
        echo json_encode($response);
    } else {
        $ubicacion = $objArray['ubicacion'];
        $fecha = $objArray['fecha'];
        $descripcion = $objArray['descripcion'];
        $titulo = $objArray['Titulo'];
        $puntuacion = $objArray['puntuacion'];
        $correoUsr = $objArray['corrUsr'];
        
        $result = mysqli_query($Cn, "INSERT INTO reportes(ubicacion,fecha,descripcion,Titulo,puntuacion,CorrUsr) values
         ('$ubicacion',$fecha,'$descripcion',$titulo,$puntuacion,'$correoUsr')");
        //$idprod = mysqli_insert_id($Cn);
        if ($result) {
            $reporte["success"] = 200; // El success=200 es que encontro eñ reporte
            $reporte["message"] = "reporte Insertado";
            array_push($response, $reporte);
            echo json_encode($response);
        } else {
            //
            $reporte["success"] = 406;
            $reporte["message"] = "reporte no Insertado";
            array_push($response, $reporte);
            echo json_encode($response);
        }
    }
} else {
    // required field is missing
    $reporte["success"] = 400;
    $reporte["message"] = "Faltan Datos entrada";
    array_push($response, $reporte);
    echo json_encode($response);
}
mysqli_close($Cn);
