//
//  PortfolioView.swift
//  MyBusinessApp
//
//  Created by Aaron on 14/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit

class PortfolioView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var array:[String] = []
    
    var name : AnyObject? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("name")
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "name")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    

    override func viewDidLoad() {
        
        array = ["PortImage1","PortImage2","PortImage3","PortImage4","PortImage5","PortImage6","PortImage7","PortImage1","PortImage2","PortImage3","PortImage4","PortImage5","PortImage6","PortImage7","PortImage1","PortImage2","PortImage3","PortImage4","PortImage5","PortImage6","PortImage7","PortImage1","PortImage2","PortImage3","PortImage4","PortImage5","PortImage6","PortImage7","PortImage1","PortImage2","PortImage3","PortImage4","PortImage5","PortImage6","PortImage7"]
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage.png")!)
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
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
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.ImageView.image = UIImage(named: array[indexPath.row])
        
        
        cell.ImageView.layer.cornerRadius = cell.ImageView.frame.size.width / 2
        cell.ImageView.clipsToBounds = true
        
        cell.ImageView.layer.borderWidth = 2.0
        cell.ImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        name = array [indexPath.row]
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
