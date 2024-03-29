//
//  ViewControllerMapa.swift
//  SwiftProject
//
//  Created by Francisco on 07/05/20.
//  Copyright © 2020 Miguel Angel Jimenez Melendez. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewControllerMapa: UIViewController {

      
    override func viewDidLoad() {
        super.viewDidLoad()
       let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
       let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
       self.view.addSubview(mapView)

       // Creates a marker in the center of the map.
       let marker = GMSMarker()
       marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
       marker.title = "Sydney"
       marker.snippet = "Australia"
       marker.map = mapView
        
    }
      
}
