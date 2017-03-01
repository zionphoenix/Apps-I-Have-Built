//
//  ViewController.swift
//  cameraApp
//
//  Created by Jason Zion on 15/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
        var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        imageView.image = UIImage(named: "beach.jpg")
        
        imagePicker.delegate = self
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraBtn(sender: UIBarButtonItem) {
        
           imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
           presentViewController(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func libraryBtn(sender: AnyObject) {
        
           imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
           presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
    }
}























