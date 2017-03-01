//
//  myCell.swift
//  yummyDesserts
//
//  Created by Jason Zion on 14/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
