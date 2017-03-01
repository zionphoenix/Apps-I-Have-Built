//
//  ContactUs.swift
//  MyBusinessApp
//
//  Created by Aaron on 22/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit
import MapKit

class ContactUs: UIViewController {
    
    
    @IBOutlet var MapView: MKMapView!
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let location = CLLocationCoordinate2D(latitude: 51.50007773, longitude: -0.1246402)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        MapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "My Business"
        annotation.subtitle = "London, United Kingdom"
        MapView.addAnnotation(annotation)
        
        self.MapView.layer.cornerRadius = self.MapView.frame.size.width / 5
        self.MapView.clipsToBounds = true
        
        self.MapView.layer.borderWidth = 3
        self.MapView.layer.borderColor = UIColor.whiteColor().CGColor
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            Button1.layer.cornerRadius = 10.0
            Button2.layer.cornerRadius = 10.0
            Button3.layer.cornerRadius = 10.0
            
        } else {
            
            Button1.layer.cornerRadius = 5.0
            Button2.layer.cornerRadius = 5.0
            Button3.layer.cornerRadius = 5.0
            Button4.layer.cornerRadius = 5.0
            
        }
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage.png")!)

        
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
    
    @IBAction func Directions(sender: AnyObject) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/maps?daddr=51.50007773,-0.1246402")!)
        
    }
    
    
    @IBAction func CallUs(sender: AnyObject) {
        
        
        var alertcontroller = UIAlertController(title: "Call Us", message: "Are you sure you would like to call us", preferredStyle: .Alert)
        
        var okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            
            
            var url:NSURL = NSURL(string: "tel://123456789")!
            UIApplication.sharedApplication().openURL(url)
            
            
            
        }
        
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
        }
        
        alertcontroller.addAction(okAction)
        alertcontroller.addAction(cancelAction)
        
        self.presentViewController(alertcontroller, animated: true, completion: nil)
    }
    
    
    
    
    

}
