//
//  SocialDetailViewController.swift
//  MyBusinessApp
//
//  Created by Aaron on 24/04/2015.
//  Copyright (c) 2015 GeekyLemonDevelopment. All rights reserved.
//

import UIKit

class SocialDetailViewController: UIViewController {
    
    var sentData:String!
    @IBOutlet var Webview: UIWebView!
    @IBOutlet var ActInd: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = sentData
        
        if self.title == "Facebook" {
            var url = NSURL(string: "http://www.facebook.com")
            var request = NSURLRequest(URL: url!)
            Webview.loadRequest(request)
        }
        if self.title == "Twitter" {
            var url = NSURL(string: "http://www.twitter.com")
            var request = NSURLRequest(URL: url!)
            Webview.loadRequest(request)
        }
        if self.title == "Google Plus" {
            var url = NSURL(string: "http://plus.google.com")
            var request = NSURLRequest(URL: url!)
            Webview.loadRequest(request)
        }

        if self.title == "LinkedIn" {
            var url = NSURL(string: "http://uk.linkedin.com")
            var request = NSURLRequest(URL: url!)
            Webview.loadRequest(request)
        }

        if self.title == "YouTube" {
            var url = NSURL(string: "http://www.Youtube.com")
            var request = NSURLRequest(URL: url!)
            Webview.loadRequest(request)
        }

        if self.title == "Website" {
            var url = NSURL(string: "http://www.Google.com")
            var request = NSURLRequest(URL: url!)
            Webview.loadRequest(request)
        }


        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func webViewDidStartLoad(_ : UIWebView) {
        ActInd.startAnimating()
    }
    
    func webViewDidFinishLoad(_ : UIWebView) {
        ActInd.stopAnimating()
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
