//
//  ServicesTableViewCell.swift
//  MyBusinessApp
//
//  Created by Aaron on 31/03/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {
    
    
    @IBOutlet var CellImage: UIImageView!
    @IBOutlet var CellLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
