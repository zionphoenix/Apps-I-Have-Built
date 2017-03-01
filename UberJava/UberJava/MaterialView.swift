//
//  MaterialView.swift
//  UberJava
//
//  Created by Jason Zion on 15/02/2016.
//  Copyright © 2016 Jason Zion. All rights reserved.
//

import UIKit

class MaterialView: UIView {
    
    override func awakeFromNib() {
        
        let SHADOW_COLOR: CGFloat = 157.0 / 255.0
        
        layer.cornerRadius = 2.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }
}
