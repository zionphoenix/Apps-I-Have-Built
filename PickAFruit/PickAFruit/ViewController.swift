//
//  ViewController.swift
//  PickAFruit
//
//  Created by Jason Zion on 12/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    var fruits = ["Pick a Fruit!", "Apples", "Oranges", "Lemons", "Limes", "Blueberries"]
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: "bowl-of-fruit.jpg")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    
    return 1
        
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return fruits.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return fruits[row]
    
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        let fruitSelected = fruits[row]
        
        switch (fruitSelected) {
        
            case "Apples":
                imageView.image = UIImage(named: "apples.jpg")
                infoLabel.text = "These apples are red."
            
            case "Oranges":
                imageView.image = UIImage(named: "orange.jpeg")
                infoLabel.text = "These oranges are orange."
            
            case "Lemons":
                imageView.image = UIImage(named: "lemon.jpg")
                infoLabel.text = "These lemons are yellow."
            
            case "Limes":
                imageView.image = UIImage(named: "lime.jpg")
                infoLabel.text = "These limes are green."
            
            case "Blueberries":
                imageView.image = UIImage(named: "blueberry.jpeg")
                infoLabel.text = "These blueberries are blue."
            
            default:
                imageView.image = UIImage(named: "bowl-of-fruit.jpg")
                infoLabel.text = "Please Enjoy Some Fruit!"
         
        }//end of switch statement.
    
    }//end of didSelectRow function. 
    
}


















