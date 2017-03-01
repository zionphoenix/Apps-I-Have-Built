//
//  LogInViewController.swift
//  UberJava
//
//  Created by Jason Zion on 29/01/2016.
//  Copyright © 2016 Jason Zion. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {
    
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    
    // reset to default size.
    var scrollViewHeight : CGFloat = 0
    
    // keyboard frame size.
    var keyboard = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // layout.
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height
        
        // label layouts.
        titleLabel.frame = CGRectMake(16, 50, theWidth - 32 , 75)
        
        // textfield layouts.
        usernameText.frame = CGRectMake(16, 180, theWidth - 32 , 30)
        
        passwordText.frame = CGRectMake(16, 230, theWidth - 32 , 30)
        
        // button layouts.
        logInButton.frame = CGRectMake(16, 330, theWidth-32, 40)
        
        signUpButton.frame = CGRectMake(16, theHeight - 70, theWidth-32, 40)
        
        forgotPasswordButton.center = CGPointMake(theWidth / 2 , self.passwordText.frame.maxY+30 )
        
        // tap to hide keyboard.
        let hideTap = UITapGestureRecognizer(target: self, action: "hideKeyboardTap:")
        hideTap.numberOfTapsRequired = 1
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        // scrollview frame size.
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        scrollView.contentSize.height = self.view.frame.height
        scrollViewHeight = scrollView.frame.size.height
        
        // check notifications if keyboard is shown or not.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    
    // hide keyboard if tapped.
    func hideKeyboardTap(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
        
    }
    
    // show keyboard.
    func showKeyboard(notification: NSNotification) {
        
        // define keyboard size.
        keyboard = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey]!.CGRectValue)!
        
        // move up UI
        UIView.animateWithDuration(0.4) { () -> Void in
            self.scrollView.frame.size.height = self.scrollViewHeight - self.keyboard.height
            
        }
        
    }
    
    // hide keyboard.
    func hideKeyboard(notification: NSNotification) {
        
        // move down UI
        UIView.animateWithDuration(0.4) { () -> Void in
            self.scrollView.frame.size.height = self.view.frame.height
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        usernameText.resignFirstResponder()
        passwordText.resignFirstResponder()
        return true
        
    }
    
    
    @IBAction func login_click(sender: AnyObject) {
        
        print("login button pressed.")
        
        // hide keyboard.
        self.view.endEditing(true)
        
        // if textfields are empty.
        if usernameText.text!.isEmpty || passwordText.text!.isEmpty {
            
            // show alert message.
            let alert = UIAlertController(title: "Please fill in fields", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "okey doke.", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
        PFUser.logInWithUsernameInBackground(usernameText.text!, password: passwordText.text!) { (user:PFUser?, error:NSError?) -> Void in
            
            if error == nil {
                
                // remember user or save in App Memory did the user login or not.
                NSUserDefaults.standardUserDefaults().setObject(user!.username, forKey: "username")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                // call login function from AppDelegate class
                let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.login()
                
            } else {
                
                // show alert message.
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription , preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "why so serious?", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }

}


























