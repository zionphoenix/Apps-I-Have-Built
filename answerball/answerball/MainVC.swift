//
//  MainVC.swift
//  answerball
//
//  Created by Jason Zion on 19/10/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import UIKit
import AVFoundation
class MainVC: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var answerText: UILabel!
    
    var answers = [
        "I'm not a mindreader!",
        "All indicators point to YES!",
        "All indicators point to NO!",
        "Watch your language!",
        "It seems highly unlikely.",
        "Please speak up!",
        "It seems highly likely.",
        "Yes, indeed!",
        "Absolutely not!",
        "Please ask again later...",
        "Seriously?",
        "That was a dumb question.",
        "I was wondering the same thing!",
        "I can't answer that truthfully.",
        "What do you think?",
        "OMG YES!",
        "OMG NO",
        "Imagine that!",
        "Really?",
        "Did you just ask that?",
        "Of course.",
        "Ask a higher power",
        "The force is with you",
        "The force is not near",
        "You're unbelievable",
        "Can I get a translation please?",
        "I'm gonna guess... NO!",
        "I'm gonna guess... YES!",
        "It would seem so.",
        "That does not seem to be true.",
        "Does a bear sh... never mind.",
        "I need a new profession!",
        "The odds are against that.",
        "Can we skip this one?",
        "Ask a different queston please.",
        "I'm doing good, yes I know you didn't ask.",
        "My connection to the stars was lost.",
        "Do you want the truth?",
        "I can see no answer but yes."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {getAnswerTapped(UIEvent)
    }
    
    
    @IBAction func getAnswerTapped(sender: AnyObject) {

        answerText.text = getAnswer()
        answerText.hidden = false
    }
    
    func getAnswer() -> String {
        let constant = Int(answers.count)
        
        let result = answers[constant]
        return result
    }

}






















