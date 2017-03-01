//
//  main.swift
//  PeopleDatabase
//
//  Created by Jason Zion on 23/10/2015.
//  Copyright © 2015 Jason Zion. All rights reserved.
//

import Foundation
var response: String
var people: [Person] = []

repeat {
    var newPerson = Person ()
    newPerson.enterInfo()
        people.append(newPerson)
    newPerson.printInfo()

    print ("Do you want to enter another name? (y/n)")
    response = input()

} while(response == "y")

print("NUmber of people in the database: \(people.count)")

for onePerson in people {
    onePerson.printInfo()
}

