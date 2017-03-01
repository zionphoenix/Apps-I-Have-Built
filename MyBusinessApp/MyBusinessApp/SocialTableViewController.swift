//
//  SocialTableViewController.swift
//  MyBusinessApp
//
//  Created by Aaron on 24/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit

class SocialTableViewController: UITableViewController {
    
    let SocialTitle = ["Facebook","Twitter","Google Plus","LinkedIn","YouTube","Website",]
    
    let SocialImages = ["SocialIcon1","SocialIcon2","SocialIcon3","SocialIcon4","SocialIcon5","SocialIcon6",]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage.png")!)
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return SocialTitle.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:SocialTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! SocialTableViewCell
        
        cell.SocialLabel.text = SocialTitle[indexPath.row]
        
        var imagename = UIImage(named: SocialImages[indexPath.row])
        cell.SocialImageview.image = imagename
        
        cell.SocialImageview.layer.cornerRadius = cell.SocialImageview.frame.size.width / 2
        cell.SocialImageview.clipsToBounds = true
        
        cell.SocialImageview.layer.borderWidth = 2.0
        cell.SocialImageview.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */



    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "DetailView") {
            
            let vc = segue.destinationViewController as! SocialDetailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                
                let social = SocialTitle[indexPath.row] as String
                vc.sentData = social
                
            }
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
