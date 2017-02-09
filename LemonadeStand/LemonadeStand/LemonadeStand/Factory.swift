//
//  Factory.swift
//  LemonadeStand
//
//  Created by Wilson Ding on 1/27/15.
//  Copyright (c) 2015 Wilson Ding. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func createArray() -> [Person] {
        var personArray: [Person] = []
        
        for var personNumber = 0; personNumber < Int(arc4random_uniform(UInt32(6)) + 5); personNumber++ {
            var newPerson = createPerson()
            personArray.append(newPerson)
        }
        
        return personArray
    }
    
    class func createPerson() -> Person {
        var newPerson: Person

        newPerson = Person(taste: Int(arc4random_uniform(UInt32(3)) + 1))
        
        return newPerson
    }
}