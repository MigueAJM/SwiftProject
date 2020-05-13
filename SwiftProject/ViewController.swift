//
//  ViewController.swift
//  SwiftProject
//
//  Created by Miguel Angel Jimenez Melendez & Francisco Lara López on 4/23/20.
//  Copyright © 2020 Miguel Angel Jimenez Melendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Reportes = [Reporte]()
    let dataJsonUrlClass = JsonClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnMapa(_ sender: Any) {
        self.performSegue(withIdentifier: "segueMapa", sender: self)
    }
    @IBAction func btnExperiencia(_ sender: Any) {
        self.performSegue(withIdentifier: "segueExperiencia", sender: self)
    }
    @IBAction func btnLista(_ sender: Any) {
        
        Reportes.removeAll()
                          let correo = "prueba@hotmail.com"
                          let datos_a_enviar = ["corrUsr": correo] as NSMutableDictionary
                          
                          //ejecutamos la función arrayFromJson con los parámetros correspondientes (url archivo .php / datos a enviar)
                          
                          dataJsonUrlClass.arrayFromJson(url:"WebServices&SQL/getReportesUsr.php",datos_enviados:datos_a_enviar){ (array_respuesta) in
                              
                              DispatchQueue.main.async {//proceso principal
                                  
                                  /*
                                   recibimos un array de tipo:
                                   (
                                       [0] => Array
                                       (
                                           [success] => 200
                                           [message] => Producto encontrado
                                           [idProd] => 1
                                           [nomProd] => Desarmador plus
                                           [existencia] => 10
                                           [precio] => 80
                                       )
                                   )
                                   object(at: 0) as! NSDictionary -> indica que el elemento 0 de nuestro array lo vamos a convertir en un diccionario de datos.
                                 
                                             
                                   */
                                  let cuenta = array_respuesta?.count
                                  
                                  for indice in stride(from: 0, to: cuenta!, by: 1){
                                      let report = array_respuesta?.object(at: indice) as! NSDictionary
                                      let idreporte = report.object(forKey: "idreporte") as! String?
                                      let ubicacion = report.object(forKey: "ubicacion") as! String?
                                      let latitud = report.object(forKey: "latitud") as! String?
                                      let longitud = report.object(forKey: "longitud") as! String?
                                      let fecha = report.object(forKey: "fecha") as! String?
                                      let descripcion = report.object(forKey: "descripcion") as! String?
                                      let titulo = report.object(forKey: "Titulo") as! String?
                                      let puntuacion = report.object(forKey: "puntuacion") as! String?
                                      //self.Reportes.append(Reporte(idrep: idreporte, ubi: ubicacion, lat: latitud,long: longitud,fecha: fecha,descrip: descripcion,titulo: titulo,puntuacion: puntuacion) )
                                      self.Reportes.append(Reporte(idrep: idreporte, ubi: ubicacion, lat: latitud,long: longitud,fecha: fecha,descrip: descripcion,titulo: titulo,puntuacion: puntuacion))
                                  }
                                self.performSegue(withIdentifier: "segueLista", sender: self)
                               
                           }
                   }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueMapa"{
            let seguex = segue.destination as! ViewControllerMapa
        }
        else if segue.identifier == "segueExperiencia"{
            let seguex = segue.destination as! ViewControllerExperiencia
        }
        else if segue.identifier == "segueLista"{
            let seguex = segue.destination as! TableViewControllerExp
            seguex.reportes = Reportes
        }
    }

}

