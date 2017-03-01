//
//  FirstViewController.swift
//  MyBusinessApp
//
//  Created by Aaron on 23/03/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    @IBOutlet var Button5: UIButton!

    override func viewDidLoad() {
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            Button1.layer.cornerRadius = 10.0
            Button2.layer.cornerRadius = 10.0
            Button3.layer.cornerRadius = 10.0
            Button4.layer.cornerRadius = 10.0
            Button5.layer.cornerRadius = 10.0
            
        } else {
            
            Button1.layer.cornerRadius = 5.0
            Button2.layer.cornerRadius = 5.0
            Button3.layer.cornerRadius = 5.0
            Button4.layer.cornerRadius = 5.0
            Button5.layer.cornerRadius = 5.0
            
        }
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage.png")!)
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func Services(sender: AnyObject) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func Portfolio(sender: AnyObject) {
        tabBarController?.selectedIndex = 2
        
    }
    
    @IBAction func AboutUs(sender: AnyObject) {
        tabBarController?.selectedIndex = 3
        
    }
    
    @IBAction func ContactUs(sender: AnyObject) {
        tabBarController?.selectedIndex = 4
        
    }
    
    
    

}

















