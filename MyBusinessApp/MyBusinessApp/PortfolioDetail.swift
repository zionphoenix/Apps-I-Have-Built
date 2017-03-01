//
//  PortfolioDetail.swift
//  MyBusinessApp
//
//  Created by Aaron on 14/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit
import Social

class PortfolioDetail: UIViewController {
    
    
    @IBOutlet var DetailImageView: UIImageView!
    @IBOutlet var DetailLabel: UILabel!
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    
    var name : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
    }
    

    override func viewDidLoad() {
        
        DetailImageView.image = UIImage(named: name as! String)
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            Button1.layer.cornerRadius = 10.0
            Button2.layer.cornerRadius = 10.0
            
        } else {
            
            Button1.layer.cornerRadius = 5.0
            Button2.layer.cornerRadius = 5.0
            
        }
        
        self.DetailImageView.layer.cornerRadius = self.DetailImageView.frame.size.width / 3
        self.DetailImageView.clipsToBounds = true
        
        self.DetailImageView.layer.borderWidth = 5
        self.DetailImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage.png")!)
        
        if DetailImageView.image == UIImage(named: "PortImage1") {
            DetailLabel.text = "Portfolio image 1"
            self.title = "Portfolio image 1"
        }
        if DetailImageView.image == UIImage(named: "PortImage2") {
            DetailLabel.text = "Portfolio image 2"
            self.title = "Portfolio image 2"
        }
        if DetailImageView.image == UIImage(named: "PortImage3") {
            DetailLabel.text = "Portfolio image 3"
            self.title = "Portfolio image 3"
        }
        if DetailImageView.image == UIImage(named: "PortImage4") {
            DetailLabel.text = "Portfolio image 4"
            self.title = "Portfolio image 4"
        }
        if DetailImageView.image == UIImage(named: "PortImage5") {
            DetailLabel.text = "Portfolio image 5"
            self.title = "Portfolio image 5"
        }
        if DetailImageView.image == UIImage(named: "PortImage6") {
            DetailLabel.text = "Portfolio image 6"
            self.title = "Portfolio image 6"
        }
        if DetailImageView.image == UIImage(named: "PortImage7") {
            DetailLabel.text = "Portfolio image 7"
            self.title = "Portfolio image 7"
        }
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func Facebook(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            facebookSheet.setInitialText("Check Out " + DetailLabel.text! + " It's Awesome")
            facebookSheet.addImage(self.DetailImageView.image)
            
            self.presentViewController(facebookSheet, animated: true, completion: nil)
            
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please log in to yout account in your settings", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    @IBAction func Twitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            facebookSheet.setInitialText("Check Out " + DetailLabel.text! + " It's Awesome")
            facebookSheet.addImage(self.DetailImageView.image)
            
            self.presentViewController(facebookSheet, animated: true, completion: nil)
            
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please log in to yout account in your settings", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}
