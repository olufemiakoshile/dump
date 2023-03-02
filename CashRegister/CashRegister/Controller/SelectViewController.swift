//
//  SelectViewController.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import UIKit

class SelectViewController: UIViewController {

    var productListFromVC = [PurchasedProduct]()
    var pListFromVC = [Product]()
    var prodTypeFromRVC : String = ""
    var prodQuantityFromRVC : Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //display view controller with segue identifiier and send data respectfully
        if segue.identifier == "toHistory"{
        let secondDestination = segue.destination as! HistoryTableViewController
        secondDestination.productListFromSVC = productListFromVC
        }
        else if segue.identifier == "toRestock"{
            let secondDestination = segue.destination as! RestockViewController
            secondDestination.productList = pListFromVC
        }
        
    }
    
    //Get data from Restock View Controller
    @IBAction func unwindToSelectViewController(segue: UIStoryboardSegue) {
        _ = segue.source as? RestockViewController 
    }
    
    //This method checks if user clicks the back navigation button, if
    //so we send data back to the view controller
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

            if self.isMovingFromParent {
        performSegue(withIdentifier: "unwindToView", sender: self)
            }
    }
}
