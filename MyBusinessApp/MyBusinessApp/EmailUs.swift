//
//  EmailUs.swift
//  MyBusinessApp
//
//  Created by Aaron on 22/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit
import MessageUI

class EmailUs: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet var Scroller: UIScrollView!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailfield: UITextField!
    @IBOutlet var numberField: UITextField!
    @IBOutlet var MessageView: UITextView!
    @IBOutlet var Button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
            
            Scroller.contentInset = UIEdgeInsetsMake(0, 0, 1000, 0)
            
            
        } else {
            
            Scroller.contentInset = UIEdgeInsetsMake(0, 0, 400, 0)
            
        }
        self.Button1.layer.cornerRadius = 5.0
        
        self.MessageView.layer.cornerRadius = 5.0
        
        self.MessageView.layer.borderWidth = 0.3
        self.MessageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        self.title = "Email Us"
        
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
    
    @IBAction func EmailUs(sender: AnyObject) {
        
        var emailTitle = "Contact Form " + nameField.text
        var MessageBody = "Name: " + nameField.text + "\nEmail: " + emailfield.text + "\nPhone Number: " + numberField.text + "\n\nMessage:\n" + MessageView.text
        var toRecipents = ["123@abc.com"]
        
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(MessageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        self.presentViewController(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        switch result.value {
            
        case MFMailComposeResultCancelled.value:
            println("Mail Cancelled")
        case MFMailComposeResultSaved.value:
            println("Mail Saved")
        case MFMailComposeResultSent.value:
            println("Mail Sent")
        case MFMailComposeResultFailed.value:
            println("Mail Failed %@", [error.localizedDescription])
        default:
            break
            
            
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
        
    }
    
    
    
    @IBAction func DismissKeyboard(sender: AnyObject) {
        
        self.resignFirstResponder()
    }
    
    
    

    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            
            textView.resignFirstResponder()
            return false
        }
        
        return true
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
