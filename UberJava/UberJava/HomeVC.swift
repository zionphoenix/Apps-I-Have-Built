//
//  HomeVC.swift
//  UberJava
//
//  Created by Jason Zion on 15/02/2016.
//  Copyright © 2016 Jason Zion. All rights reserved.
//

import UIKit
import Parse

//var userName = ""

class HomeVC: UIViewController {
    
    @IBOutlet var backgroundView: MaterialView!
    @IBOutlet var imageViewBackground: MaterialView!
    @IBOutlet var profilePicture: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var orderCoffeeButton: UIButton!
    @IBOutlet var deliverCoffeeButton: UIButton!
    
    var resultsImageFiles = [PFFile]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // layouts.
        let theWidth = view.frame.size.width
        let theHeight = view.frame.size.height

        backgroundView.frame = CGRectMake(0, 0, self.view.frame.width, theHeight / 4)
        backgroundView.layer.zPosition = -1
        
        imageViewBackground.frame = CGRectMake(theWidth / 4 , 50, theWidth / 2, 140)
        imageViewBackground.layer.zPosition = -1
        
        // profile image layout.
        profilePicture.center = CGPointMake(theWidth/2, 120 )
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width/2
        profilePicture.clipsToBounds = true
        
        // order a coffee button layout.
        orderCoffeeButton.frame = CGRectMake(16, 250, theWidth-32, 40)
        
        // deliver coffee button layout.
        deliverCoffeeButton.frame = CGRectMake(16, 325, theWidth-32, 40)
        
        // information regarding information layout.
        usernameLabel.frame = CGRectMake(16, self.imageViewBackground.frame.maxY+10, theWidth-32, 40)
        
        // username label.
        let userProfileName = PFUser.currentUser()?.objectForKey("profileName") as! String
        usernameLabel.text = userProfileName
        
        let profilePictureObject = PFUser.currentUser()?.objectForKey("photo") as! PFFile
        profilePictureObject.getDataInBackgroundWithBlock { (imageData:NSData?, error:NSError?) -> Void in
            
            if (imageData == nil) {
                
                print(error!.localizedDescription)
                
            } else {
                
                self.profilePicture.image = UIImage(data: imageData!)
            }
            
        }
    
    }
    
}


