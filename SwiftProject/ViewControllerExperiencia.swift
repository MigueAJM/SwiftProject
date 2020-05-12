//
//  ViewControllerExperiencia.swift
//  SwiftProject
//
//  Created by Francisco on 07/05/20.
//  Copyright © 2020 Miguel Angel Jimenez Melendez. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import MapKit
import CoreLocation

class ViewControllerExperiencia: UIViewController, CLLocationManagerDelegate{
    
    var ubicacion: String = ""
    //var fecha: Date = Date()
    let dateFormatter = DateFormatter()
    var fechaBDD: String = ""
    
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblUbicacion: UILabel!
    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtDescripcion: UITextView!
    @IBOutlet weak var txtPuntuacion: UITextField!
    
    
    let locationManager:CLLocationManager = CLLocationManager()
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //locationManager.stopUpdatingLocation()
        dateFormatter.setLocalizedDateFormatFromTemplate("ddMMyy hh:mm:ss")
        

    }
    
    @IBAction func btnIngresar(_ sender: Any) {
    }
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var ubicacion = ""
       // var fecha: Date
       
        
        for currentLocation in locations {
            ubicacion = "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
            var fecha: Date = currentLocation.timestamp
            fechaBDD = "\(dateFormatter.string(from: fecha))"
            //fecha = currentLocation.timestamp
            //print("\(index): \(currentLocation)")
            print("\(currentLocation.timestamp)")
            
            //print("\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)")
            lblUbicacion.text = ubicacion
            lblFecha.text = "\(dateFormatter.string(from: fecha))"
                    print("\(dateFormatter.string(from: fecha))")
        }
        
    }

    
    
    func alerta(title: String, message: String){
        //Crea una alerta
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //Agrega un boton
        alert.addAction(UIAlertAction(title: "Aceptar",style: UIAlertAction.Style.default, handler: nil))
        //Muestra la alerta
        self.present(alert, animated: true, completion: nil)
    }
   
}


    

