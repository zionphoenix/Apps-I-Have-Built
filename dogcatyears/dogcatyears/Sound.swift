//
//  Sound.swift
//  dogcatyears
//
//  Created by Jason Zion on 19/10/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import Foundation

class Sound {
    var fileName : String
    var Extension : String
    
    init(fileName: String, fileExtension : String) {
        self.fileName = fileName
        self.fileExtension = fileExtension
    }
}

let bark = Sound(fileName: "Wolf howl sound effect", fileExtension: "mp3")
let meow = Sound(fileName: "cat meow", fileExtension: "mp3")

