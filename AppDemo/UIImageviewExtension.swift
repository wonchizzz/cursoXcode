//
//  UIImageviewExtension.swift
//  AppDemo
//
//  Created by AdministradorUTM on 07/12/16.
//  Copyright © 2016 CursodeIOs. All rights reserved.
//

import UIKit


extension UIImageView{
    func loadPicture(url: String)
    {
        do{
            let dato = try Data(contentsOf: URL(string: url)!)
            self.image = UIImage(data: dato)
            
        }catch{
            print("Error: \(error)")
        }
    }
    
}
