//
//  DetailViewController.swift
//  yummyDesserts
//
//  Created by Jason Zion on 15/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailImage: UIImageView!
    
    @IBOutlet var detailLabel: UILabel!
    
    @IBOutlet var moreInfoLabel: UILabel!
    
    var imageDetail = ""
    var descriptionLabel = ""
    var moreInfoDetail = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImage.image = UIImage(named: imageDetail)
        detailLabel.text = descriptionLabel
        moreInfoLabel.text = moreInfoDetail
        

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

}
