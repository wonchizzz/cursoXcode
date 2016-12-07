//
//  ViewController.swift
//  AppDemo
//
//  Created by AdministradorUTM on 05/12/16.
//  Copyright © 2016 CursodeIOs. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleviewControlllerDelegate,AgregarViewControllerDelegate{
    //MARK : Declaraciones
    var filaSelecionada = -1
    var esEdicion = false
    
    var datos = [ ("Alan",30),("Ramon",25),("Carlos",38),("Denisse",27),("juan",26),("Alan",30),("Ramon",25),("Carlos",38),("Denisse",27),("Alan",30),("Ramon",25),("Carlos",38),("Denisse",27),("Alan",30),("Ramon",25),("Carlos",38),("Denisse",27),("Alan",30),("Ramon",25),("Carlos",38),("Denisse",27),("Alan",30),("Ramon",25),("Carlos",38),("Denisse",27)]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Vista cargada")
        imgFoto.image = UIImage(named: "perro")
        imgNombre.text = " EL PERRO"
    }
    @IBOutlet weak var imgNombre: UILabel!
    
    @IBOutlet weak var imgFoto: UIImageView!
    
    @IBOutlet weak var buton: UIButton!
    
    @IBOutlet weak var tlbTabla: UITableView!

    @IBAction func btnRefresh(_ sender: Any) {
        let idFacebook = FBSDKAccessToken.current().userID
        let cadenaURL = "http://graph.facebook.com/\(idFacebook!)/picture?type=large"
       
        imgFoto.loadPicture(url: cadenaURL)
        
        
        
    }
    @IBAction func btnPresionado(_ sender: Any) {
        print("boton presionado")
        performSegue(withIdentifier: "Agregar Segue", sender: self)
        
    }
    @IBAction func btnGuardar(_ sender: Any){
     performSegue(withIdentifier: "Agregar Segue", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -UIview Delegates
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        switch segue.identifier!{
        case "Datelle Segue":
            let view = segue.destination as! DetalleViewController
            
            view.numeroFilas = filaSelecionada
            view.dato = datos[filaSelecionada].0
            view.datoNumero = datos[filaSelecionada].1
            
            view.delegado = self
            break
        case "Agregar Segue":
            let view = segue.destination as! AgregarViewController
         if(esEdicion) {
            view.fila = filaSelecionada
            view.Nombre = datos[filaSelecionada].0
            view.Edad = datos[filaSelecionada].1
            esEdicion = false
           }
        
            view.delegado = self
            break
        default:
              break
        }
        
   
    }
    // MARK: Agregar Delegates
    func agregarRegistro(nombre: String, edad: Int){
        datos.append((nombre, edad))
        tlbTabla.reloadData()
    }
    
    func modificarRegistro(nombre: String, edad: Int, fila: Int){
    datos.remove(at: fila)
    datos.insert((nombre,edad), at: fila)
    tlbTabla.reloadData()
    }
    
    //  MARK: Datalleview Delegates
    func numeroCambiado(numero: Int){
        print("numero cambiado \(numero)")
        datos[numero].1 = datos[numero].1+1
        tlbTabla.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        return datos.count
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar = UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFilas)
        
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return [eliminar,editar]
    }
    func borrarFilas(sender: UITableViewRowAction, indexPath: IndexPath){
        datos.remove(at: indexPath.row)
        tlbTabla.reloadData()
    }
    
    
    func editarFila(sender: UITableViewRowAction, indexPath: IndexPath){
        esEdicion = true
        filaSelecionada = indexPath.row
        performSegue(withIdentifier: "Agregar Segue", sender: sender)
        tlbTabla.reloadData()
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        //let proto = (indexPath.row % 2 == 0 ) ? "proto1" : "proto2"
        let vista = tableView.dequeueReusableCell(withIdentifier: "proto1", for: indexPath) as! ilaTableViewCell
        
        
        vista.lbIzquierda.text = "\(datos[indexPath.row].0)"
        vista.lbDerecha.text = "\(datos[indexPath.row].1)"
        
        let idFacebook = FBSDKAccessToken.current().userID
        let cadenaURL = "http://graph.facebook.com/\(idFacebook!)/picture?type=large"
        
        vista.imgFila.loadPicture(url: cadenaURL)
        
        return vista
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        filaSelecionada = indexPath.row
        
        performSegue(withIdentifier: "Detalle segue", sender: self)
        
    }
    
}

