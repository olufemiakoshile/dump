//
//  ViewController.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,
                      UITableViewDataSource {

    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var productType: UILabel!
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var productQuantity: UILabel!
    
    var addProductQuantity : Add?
    var updateProductQuantity : Delete?
    var products : ProductList?
    var purchasedProduct : PurchaseCollection?
    var displayQuantity = ""
    var upQuantity : Int? = nil

    var upProduct = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = (UIApplication.shared.delegate as! AppDelegate).products
        addProductQuantity = (UIApplication.shared.delegate as! AppDelegate).addProductQuantity
        updateProductQuantity = (UIApplication.shared.delegate as! AppDelegate).updateProductQuantity
        purchasedProduct = (UIApplication.shared.delegate as! AppDelegate).purchasedProduct
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (products?.allProducts.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
            return 55
        
        }
    
    //display all products to the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProductTableViewCell
        
        cell.productType.text = products!.allProducts[indexPath.row].name
        cell.productQuantity.text = String(products!.allProducts[indexPath.row].quantity)
        cell.productPrice.text = String(products!.allProducts[indexPath.row].price)
        
        
        return cell;
    }
    
    //get the selected product name and display it to the label
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productType.text = products!.allProducts[indexPath.row].name
        totalPrice.text = "Total"
        productQuantity.text = "Quantity"
        displayQuantity = ""
    }

    
    @IBAction func quantityButton(_ sender: UIButton) {
      //check if the product type is displayed, if not an error alert is displayed to user
        if productType.text == "Type"{
            let alert = UIAlertController(title: "Error", message: "Select a Product", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: .none)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        else {
            //checks if users enters a quantity, if not an error alert is displayed
            displayQuantity = displayQuantity + (sender.titleLabel?.text)!
            for p in products!.allProducts{
                if p.name == productType.text{
                    if p.quantity < Int(displayQuantity)!{
                        let alert = UIAlertController(title: "Error", message: "Quantity Limit Exceeded", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: .none)
                        
                        alert.addAction(action)
                        
                        present(alert, animated: true, completion: nil)
                        
                        productQuantity.text = ""
                        displayQuantity = ""
                    }
                    else{
                        //if all inputs are valid then the total price is calculated and displayed
                        productQuantity.text = displayQuantity
                        totalPrice.text = String(Double(displayQuantity)! * p.price)
                    }
                }
            }
        }
    }
    
    
    @IBAction func buyProduct(_ sender: Any) {
        if productQuantity.text == "Quantity" || productType.text == "Type"{
            let alert = UIAlertController(title: "Error", message: "Select a quantity and Product", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: .none)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        //if user buys the product the product quantity is updated
        if let quantity = Int(productQuantity.text!){
            
            self.products = updateProductQuantity!.updateQuantity(name: productType.text!, quantity: quantity)
            
            let amount = Double(totalPrice.text!)
          
            purchasedProduct!.addPurchase(p: productType.text!, q: quantity, d : Date.now, a : amount!)
            productQuantity.text = "Quantity"
            totalPrice.text = "Total"
            productType.text = "Type"
            
            productTable.reloadData()
        }
    }
    
    //Sends the product list to select view controller and displays select view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstDestination = segue.destination as! SelectViewController
        firstDestination.productListFromVC = purchasedProduct!.allPurchase
        firstDestination.pListFromVC = products!.allProducts
        productType.text = "Type"
        productQuantity.text = "Quantity"
        totalPrice.text = "Total"
   
        productTable.reloadData()
    }
    
    //get the updated product data from select view controller
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        _ = segue.source as! SelectViewController
        productTable.reloadData()
    }
}

