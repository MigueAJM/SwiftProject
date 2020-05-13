//
//  usuario.swift
//  SwiftProject
//
//  Created by Francisco on 12/05/20.
//  Copyright © 2020 Miguel Angel Jimenez Melendez. All rights reserved.
//

import Foundation

class Usuario    {
    
    var foto: String?
    var nombre: String?
    var correo: String?
    var fechaNac: String?
    var sexo: String?
    var telefono: String?
    
    
    init(foto: String?, nom: String?, correo: String?,fecha: String?,sex: String?,tel: String?) {
        self.foto  = foto
        self.nombre = nom
        self.correo = correo
        self.fechaNac = fecha
        self.sexo = sex
        self.telefono = tel

    }
}
