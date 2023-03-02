//
//  PurchaseCollection.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import Foundation
class PurchaseCollection{
    var allPurchase : [PurchasedProduct] = [PurchasedProduct]()
    
    //Add purchased product details
    func addPurchase(p : String, q : Int, d : Date, a : Double){
        allPurchase.append(PurchasedProduct(p: p, q : q, d : d, a : a))
    }
}
