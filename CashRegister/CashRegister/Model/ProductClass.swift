//
//  ProductClass.swift
//  CashRegister
//
//  Created by Mac on 2023-02-25.
//

import Foundation

class Product{
    var name : String ;
    var quantity : Int;
    var price : Double;
    
    init(n : String, q : Int, p: Double){
        name = n
        quantity = q
        price = p
    }
}
