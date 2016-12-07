//
//  ilaTableViewCell.swift
//  AppDemo
//
//  Created by AdministradorUTM on 05/12/16.
//  Copyright © 2016 CursodeIOs. All rights reserved.
//

import UIKit

class ilaTableViewCell: UITableViewCell {

    @IBOutlet weak var lbIzquierda: UILabel!
    
    
    @IBOutlet weak var lbDerecha: UILabel!
    
    @IBOutlet weak var imgFila: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
