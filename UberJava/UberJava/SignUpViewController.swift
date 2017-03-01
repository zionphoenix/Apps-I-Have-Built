//
//  SignUpViewController.swift
//  UberJava
//
//  Created by Jason Zion on 29/01/2016.
//  Copyright © 2016 Jason Zion. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    // outlets.
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    // reset to default size.
    var scrollViewHeight : CGFloat = 0
    
    // keyboard frame size.
    var keyboard = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layouts.
        let theWidth = view.frame.size.width
        
        // profile image layout.
        profilePicture.center = CGPointMake(theWidth/2, 80 )
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2
        profilePicture.clipsToBounds = true
        
        // adding image button layout.
        addImageButton.center = CGPointMake(self.profilePicture.frame.maxX+30, 80 )
        
        // email input layout.
        emailTextField.frame = CGRectMake(16, 150, theWidth-32, 30)
        
        // password input layout.
        passwordTextField.frame = CGRectMake(16, 200, theWidth-32, 30)
        
        // username layout.
        usernameTextField.frame = CGRectMake(16, 250, theWidth-32, 30)
        
        // sign up button layout.
        signUpButton.frame = CGRectMake(16, 300, theWidth-32, 40)
        
        // cancel button layout.
        cancelButton.center = CGPointMake(theWidth/12, 60)
        
        
        // scrollview frame size.
        scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        scrollView.contentSize.height = self.view.frame.height
        scrollViewHeight = scrollView.frame.size.height
        
        // check notifications if keyboard is shown or not.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        
        // declare hide keyboard tap.
        let hideTap = UITapGestureRecognizer(target: self, action: "hideKeyboardTap:")
        hideTap.numberOfTapsRequired = 1
        self.view.userInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
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
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        
        return true
        
    }
    
    @IBAction func cancelButton_click(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func addImageButton_click(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = true
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        profilePicture.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func signUpButton_click(sender: AnyObject) {
        
        // dismiss keyboard.
        self.view.endEditing(true)
        
        // if fields are empty.
        let userName5 = emailTextField.text
        let userPassword = passwordTextField.text
        let profileName = usernameTextField.text
        
        if(userName5!.isEmpty || userPassword!.isEmpty || profileName!.isEmpty) {
            
            let myAlert = UIAlertController(title: "Sign Up Error!", message: "You may have forgotten to fill out 'one' or more of the fields!", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "Oh no! I'll try again!", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
        }
        
        // activity indicator
        let spinningActivity = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        spinningActivity.labelText = "Nearly There!"
        spinningActivity.detailsLabelText = "Please remain awesome."
        
        // send data to server to related columns.
        let user = PFUser()
        user.username = emailTextField.text?.lowercaseString
        user.password = passwordTextField.text?.lowercaseString
        user.email = emailTextField.text?.lowercaseString
        user["profileName"] = usernameTextField.text?.lowercaseString
        
        // convert our image for sending to server.
        let imageData = UIImagePNGRepresentation(self.profilePicture.image!)
        let imageFile = PFFile(name: "EmptyProfilePicOrange.png", data: imageData!)
        user["photo"] = imageFile
        
        // save data in server.
        user.signUpInBackgroundWithBlock {
            (succeeded:Bool, signUpError:NSError?) -> Void in
            
            if signUpError == nil {
                
                print("signup")
                
                let installation:PFInstallation = PFInstallation.currentInstallation()
                installation["user"] = PFUser.currentUser()
                installation.saveInBackground()
                
                MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                
                // remember logged user.
                NSUserDefaults.standardUserDefaults().setObject(user.username, forKey: "username")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                // calls login function from AppDelegate class.
                let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.login()
                
            } else {
                
                var userMessage = "Registration Unsuccessful!"
                
                if (!succeeded){
                    
                    userMessage = signUpError!.localizedDescription
                    
                }
                
                let myAlert = UIAlertController(title: "Oh no!", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "I'll try again!", style: UIAlertActionStyle.Default){ action in
                    
                }
                
                myAlert.addAction(okAction)
                
                self.presentViewController(myAlert, animated: true, completion: nil)
            }
        }
    
    }
    
}























