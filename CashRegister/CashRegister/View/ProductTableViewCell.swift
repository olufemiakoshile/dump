//
//  ProductTableViewCell.swift
//  CashRegister
//
//  Created by Daniel on 2023-02-24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    //custom cell displaying the name, quantity and price for each product
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productType: UILabel!
    
    @IBOutlet weak var productQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
