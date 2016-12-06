//
//  DetalleViewController.swift
//  AppDemo
//
//  Created by AdministradorUTM on 06/12/16.
//  Copyright © 2016 CursodeIOs. All rights reserved.
//

import UIKit
protocol DetalleviewControlllerDelegate {
    func numeroCambiado(numero: Int)
}

class DetalleViewController: UIViewController {
    // MARK: Declaraciones
    var numeroFilas = -1
    var dato : String = ""
    var datoNumero : Int = 0
    var delegado : DetalleviewControlllerDelegate? = nil
    
    @IBOutlet weak var lblNombre: UILabel!
    
    // MARK: Meteodos

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblNombre.text = "\(numeroFilas)"
         lblNombre.text = "Has elegido a \(dato) y tiene \(datoNumero) años."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
