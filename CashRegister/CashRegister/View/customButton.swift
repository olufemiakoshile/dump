//
//  customButton.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import UIKit

class customButton: UIButton {
    
    //Design the border the buttons
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = layer.frame.height/5
    }

}
