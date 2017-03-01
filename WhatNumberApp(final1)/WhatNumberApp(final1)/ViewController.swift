//
//  ViewController.swift
//  WhatNumberApp(final1)
//
//  Created by Jason Zion on 10/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var correct = arc4random_uniform(5)

    @IBOutlet var message: UILabel!
    
    @IBOutlet var guessField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(correct)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkButton(sender: UIButton) {
        
        let guess = guessField.text
        let correctGuess = String(correct)
        guessField.text = ""
        
        if guess == correctGuess{
            message.text = "Correct Answer!"
            message.textColor = UIColor.greenColor()
        }
        else {
            message.text = "Wrong Answer! Try Again!"
            message.textColor = UIColor.redColor()
       
        }
    }

}

