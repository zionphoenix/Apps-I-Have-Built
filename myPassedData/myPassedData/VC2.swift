//
//  VC2.swift
//  myPassedData
//
//  Created by Jason Zion on 13/11/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet var label: UILabel!
    
        var outputMessage = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = outputMessage
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
