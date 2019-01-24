//
//  NamesCVCell.swift
//  TableViewWithRX
//
//  Created by Lahiru Chathuranga on 1/24/19.
//  Copyright © 2019 Elegant Media pvt ltd. All rights reserved.
//

import UIKit

class NamesCVCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var nameSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameSwitch.isOn = false
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(element: String) {
        lblName.text = element
    }
    
}
