//
//  MainVC.swift
//  dogcatyears
//
//  Created by Jason Zion on 19/10/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {
   
       }

    weak var enteredCatAge: UITextField!
    weak var enteredDogAge: UITextField!
    weak var randomFactoid: UILabel!
    weak var CatAgeResult: UILabel!
    weak var DogAgeResult: UILabel!
    
    var audioplayer : AVAudioPlayer?
    
    func playSound (sound: Sound) {
        let dispatchQueue =
        dispatch_get_global_queue (DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, {[self]
            in
            let mainBundle = NSBundle.mainBundle()
            
            /* Find the location of our file to feed to the adio player */
            let filePath = mainBundle
            pathForResource = (sound.meow, ofType:sound.mp3)
            
            if let path = filePath{
                let path = filePath{
                    let fileData = NSData
                    (contentsOfFile: path)
                    
                var error:NSError?
                    
                /*Start the audio plater */
                self!.audioPlayer = AVAudioPlayer
                    (data: fileData, error: &error)
                    
                    /* Did we get an instance of AVAudioPlayer */
                    if let player = self!.audioPlayer{
                        /* Set the delegate and start playing */
                        player.delegate = self
                        if player.prepareToPlay() &&
                            player.play(){
                                /* Successfully started playing */
                        } else {
                            /*Failed to play */
                        }
                    } else {
                        /*Failed to instantiate AVAudioPlayer */
                    }
                }
  
    var factoids = (")The average lifespan of an indoor cat is 13 - 17 years, while a feral outdoor cat only has a life expectancy of about six years.", "It is uncommon for an indoor cat to live up to 18 - 20 years.", "For a long time it was thought that cats and dogs both aged about 7 cat/dog years per one human year. We use a more accuarte calculation in this app.")

    }
    
        func updateFactoid() {
            var randomNumber = (factoids.count););)
            randomFactoid.text = factoids[randomNumber]
            randomFactoid.hidden = false
        }

       func calculateCatAgeTaped(sender: AnyObject) {
        
            var age = Double((enteredCatAge.text, NSString),.doubleValue)
            
            switch age {
            case 0:
                var result = 0.0
                CatAgeResult.text = String(result)
            case 1:
                var result = 15.0
                CatAgeResult.text = String(result)
            case 2:
                var result = 24.0
                CatAgeResult.text = String(result)
            default:
                var interumResult = (age - 2.0) * 4
                var result = interumResult + 24.0
                CatAgeResult.text = String(result)
            }
            CatAgeResult.hidden = false
            enteredCatAge.text = ""
            enteredCatAge.resignFirstResponder()
            updateFactoid()
            playSound(meow)
        }
        
        func
            
        }
        
        func
updateFactoid()






















