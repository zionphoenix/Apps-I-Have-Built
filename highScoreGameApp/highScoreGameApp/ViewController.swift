//
//  ViewController.swift
//  highScoreGameApp
//
//  Created by Jason Zion on 20/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var player: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var highScore: UILabel!
    @IBOutlet var leader: UILabel!
    @IBOutlet var textField: UITextField!
    
        let userDefaults = NSUserDefaults.standardUserDefaults()
    
        var users = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPlayer(sender: UIButton) {
        
        let currentPlayer = textField.text
        player.text = currentPlayer
        users.append(currentPlayer!)
        userDefaults.setObject(users, forKey: "usernames")
        print(users)
        
    }

    @IBAction func addToScore(sender: UIButton) {
    }
    
    @IBAction func reset(sender: UIButton) {
    }
    
    
    
    
    
}

