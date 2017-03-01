//
//  ViewController.swift
//  SayHiApp
//
//  Created by Jason Zion on 8/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
   
    @IBOutlet var nameField: UITextField!
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        let nameEntered = nameField.text
        messageLabel.text = "Hi there\(nameEntered)"
        nameField.text = ""
        nameField.resignFirstResponder()
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

