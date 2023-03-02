//
//  Update.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import Foundation
class Delete{
    var products = ProductList()
    
    //Delete quantity from a product
    func updateQuantity(name n: String, quantity q: Int) -> ProductList{
        for p in products.allProducts{
            if p.name == n{
                p.quantity = p.quantity - q
            }
        }
        return products
    }
}

