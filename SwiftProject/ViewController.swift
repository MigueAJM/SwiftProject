//
//  ViewController.swift
//  SwiftProject
//
//  Created by Miguel Angel Jimenez Melendez & Francisco Lara López on 4/23/20.
//  Copyright © 2020 Miguel Angel Jimenez Melendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        self.performSegue(withIdentifier: "segueLista", sender: self)
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
        }
    }

}

