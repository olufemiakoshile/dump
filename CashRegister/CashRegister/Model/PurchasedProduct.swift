//
//  PurchasedProduct.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import Foundation

//purchased product class to contain delails of products purchased
class PurchasedProduct{
    var purProduct : String;
    var purQuantity : Int;
    var purTime : Date;
    var purAmount : Double
    
    init(p : String, q : Int, d : Date, a : Double){
        purProduct = p
        purQuantity = q
        purTime = d
        purAmount = a
    }
}
