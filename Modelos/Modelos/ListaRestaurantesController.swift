//
//  ViewController.swift
//  Modelos
//
//  Created by Alumno on 10/4/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import UIKit

class ListaRestaurantesController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var restaurantes : [Restaurante] = []
    
    @IBOutlet weak var tvRestaurantes: UITableView!
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda =  tableView.dequeueReusableCell(withIdentifier: "celdaRestaurante") as! CeldaRestaurantController
        celda.lblNombre.text = restaurantes[indexPath.row].nombre
        celda.lblHorario.text = restaurantes[indexPath.row].horario
        celda.lblDireccion.text = restaurantes[indexPath.row].direccion
        
        return celda
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! DetallesRestaurantController
        destino.restaurante = restaurantes[tvRestaurantes.indexPathForSelectedRow!.row]
        destino.callbackActualizarTablaContactos = actualizarTablaContactos
        
    }
   

    override func viewDidLoad() {
        self.title = "Contactos"
        
        super.viewDidLoad()
        restaurantes.append(Restaurante(nombre: "Jose" , direccion: "Jose@correo.com", horario: "6444101010" ))
        restaurantes.append(Restaurante(nombre: "Maria" , direccion: "Maria@correo.com", horario: "6444202020" ))
        restaurantes.append(Restaurante(nombre: "Ana" , direccion: "Ana@correo.com", horario: "6444303030" ))
        // Do any additional setup after loading the view.
    }
    
    func actualizarTablaContactos(){
        tvRestaurantes.reloadData()
    }

}

