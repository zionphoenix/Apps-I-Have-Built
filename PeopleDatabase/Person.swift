//
//  Person.swift
//  PeopleDatabase
//
//  Created by Jason Zion on 23/10/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import Foundation

var str = "my name is jason and i'm a billionaire."

class Person {
    
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        if let string = rawString {
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else {
            return "Invalid input"
        }
    }
    
    func changeFirstName(newFirstName:String) {
        firstName = newFirstName
   
    }
    
    func enterInfo() {
        print("What is your first name?")
        firstName = input()
        print("What is \(firstName)'s last name?")
        lastName = input()
        print("How old is \(firstName) \(lastName)")
        let userInput = Int(input())
        if let number = userInput {
            age = number
        }
    }
    
    func printInfo() {
        print("\(firstName) \(lastName) is \(age) years old")
        
    }
    
}
