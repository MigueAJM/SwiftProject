<?php
/*
 * El siguiente código Elimina un reporte
 * Stark Sept/2019
 */
$response = array();
$reporte = array();
$Cn = mysqli_connect("localhost", "root", "", "securityapp") or die("server no encontrado");
mysqli_set_charset($Cn, "utf8");
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $objArray = json_decode(file_get_contents("php://input"), true);
    if (empty($objArray)) {
        // required field is missing
        $reporte["success"] = 400;
        $reporte["message"] = "Faltan Datos entrada";
        array_push($response, $reporte);
        echo json_encode($response);
    } else {
        $idProd = $objArray['idreporte'];
        $result = mysqli_query($Cn, "DELETE FROM reportes WHERE idreporte=$idreporte");
        if ($result) {
            $reporte["success"] = 200; // El success=200 es que encontro eñ reporte
            $reporte["message"] = "reporte Eliminado";
            array_push($response, $reporte);
            echo json_encode($response);
        } else {
            //
            $reporte["success"] = 406;
            $reporte["message"] = "El reporte no se Elimino";
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