//
//  AboutUs.swift
//  MyBusinessApp
//
//  Created by Aaron on 17/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit

class AboutUs: UIViewController {
    
    
    @IBOutlet var Scroller: UIScrollView!
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            Scroller.contentInset = UIEdgeInsetsMake(0, 0, 1000, 0)
            
            
        } else {
            
            Scroller.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
            
        }
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            Button1.layer.cornerRadius = 10.0
            Button2.layer.cornerRadius = 10.0
            
        } else {
            
            Button1.layer.cornerRadius = 5.0
            Button2.layer.cornerRadius = 5.0
            
        }
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage.png")!)

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillLayoutSubviews() {
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            self.Scroller.frame = self.view.bounds
            self.Scroller.contentSize.height = 1000
            self.Scroller.contentSize.width = 0
            
        } else {
            
            self.Scroller.frame = self.view.bounds
            self.Scroller.contentSize.height = 400
            self.Scroller.contentSize.width = 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func ContactUs(sender: AnyObject) {
        
        tabBarController?.selectedIndex = 4
        
        
    }
    
    
    
    
    
    
    
    
    
    

}
