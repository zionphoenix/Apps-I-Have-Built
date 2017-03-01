//
//  TableViewController.swift
//  yummyDesserts
//
//  Created by Jason Zion on 14/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var foodArray:[Food] = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let food1 = Food(imageName: "cake.jpg" , description: "Chocolate Cake", moreInfo: "There is nothing greater than a great chocolate cake.")
        let food2 = Food(imageName: "meringue.jpg", description: "Meringue & Berries", moreInfo: "I really don't like meringue but it's a nice photo.")
        let food3 = Food(imageName: "peaches.jog", description: "Grilled Peaches", moreInfo: "This would be perfect as a summer time dessert.")
        let food4 = Food(imageName: "tiramisu.jpg", description: "Tiramisu", moreInfo: "One of my favourite italian desserts. Yum!")
        
        foodArray.append(food1)
        foodArray.append(food2)
        foodArray.append(food3)
        foodArray.append(food4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodArray.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! myCell

        let foodItem = foodArray[indexPath.row]
        
        cell.myImageView.image = UIImage(named: foodItem.imageName)
        cell.myLabel.text = foodItem.description

        return cell
    }
 
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let foodSelected = foodArray[indexPath.row]
        let detailVC:DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        
        detailVC.imageDetail = foodSelected.imageName
        detailVC.descriptionLabel = foodSelected.description
        detailVC.moreInfoDetail = foodSelected.moreInfo
        
        self.presentViewController(detailVC, animated: true, completion: nil)
    }
 
}




























