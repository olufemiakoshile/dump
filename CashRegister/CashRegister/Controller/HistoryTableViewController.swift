//
//  HistoryTableViewController.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    var productListFromSVC = [PurchasedProduct]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productListFromSVC.count
    }

    //display the purchased product details to the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = productListFromSVC[indexPath.row].purProduct
        cell.detailTextLabel?.text = "\(productListFromSVC[indexPath.row].purQuantity)"

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Send the selected cell purchased producct details to the Details view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdDestination = segue.destination as! DetailsViewController
        if let index = self.tableView.indexPathForSelectedRow{
            thirdDestination.detailsType = productListFromSVC[index.row].purProduct
            thirdDestination.detailsQuantity = "\(productListFromSVC[index.row].purQuantity)"
            thirdDestination.detailsTime = "\(productListFromSVC[index.row].purTime)"
            thirdDestination.detailsAmount = "\(productListFromSVC[index.row].purAmount)"
        }
    }
}
