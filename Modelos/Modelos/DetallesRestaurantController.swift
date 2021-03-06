//
//  DetallesRestaurantController.swift
//  Modelos
//
//  Created by Alumno on 10/6/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import Foundation
import UIKit

class DetallesRestaurantController : UIViewController {
    
    var restaurante : Restaurante?
    var callbackActualizarTablaContactos : (() ->Void)?
    
    @IBOutlet weak var txtCNombre: UITextField!
    @IBOutlet weak var txtCContacto: UITextField!
    @IBOutlet weak var txtCCelular: UITextField!
    override func viewDidLoad() {
        self.title = "Editar Contacto"

        
        txtCNombre.text = restaurante!.nombre
        txtCContacto.text = restaurante!.direccion
        txtCCelular.text = restaurante!.horario
        //Segunda pantalla
        
    
        

        
    }
    @IBAction func doTapGuardar(_ sender: Any) {
        restaurante!.nombre = txtCNombre.text!
        restaurante!.direccion = txtCContacto.text!
        restaurante!.horario = txtCCelular.text!
        
        callbackActualizarTablaContactos!()
    }
}
