//
//  ViewController.swift
//  AppDemo
//
//  Created by AdministradorUTM on 05/12/16.
//  Copyright © 2016 CursodeIOs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Vista cargada")
    }
    @IBOutlet weak var buton: UIButton!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let proto = (indexPath.row % 2 == 0 ) ? "proto1" : "proto2"
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! ilaTableViewCell
        
        if indexPath.row % 2 == 0{
        vista.lbIzquierda.text = "Index!"
        vista.lbDerecha.text = "\(indexPath.row)"
        
        } else {
        vista.lbDerecha.text = "\(indexPath.row)"
        vista.lbIzquierda.text = "Index!"
        
        }
        return vista
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Fila \(indexPath.row)")
    }
    
}

