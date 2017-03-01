//
//  ViewController.swift
//  shoppingListApp
//
//  Created by Jason Zion on 12/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = [String]()
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func addButton(sender: UIButton) {
        
        let newItem = textField.text
        items.append(newItem!)
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
            cell.textLabel?.text = items[indexPath.row]
            cell.textLabel?.textColor = UIColor.redColor()
        
            return cell
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedRow = tableView.cellForRowAtIndexPath(indexPath)!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.None {
            selectedRow.accessoryType = UITableViewCellAccessoryType.Checkmark
            selectedRow.tintColor = UIColor.greenColor()
            
        }
        
        else {
            
            selectedRow.accessoryType = UITableViewCellAccessoryType.None
        
        } // end of if/else statement
    
    } // end of didSelectRow function
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let deletedRow:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            deletedRow.accessoryType = UITableViewCellAccessoryType.None
            
        } // end of EditingStyle statement.

    } // end of tableView statement.
    
} // end of app.











































