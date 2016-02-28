//
//  Dog.swift
//  DogData
//
//  Created by Bruce Burgess on 2/28/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import Foundation
import RealmSwift //importing realm database

//create a dog class with realm must use dynamic and Object
class Dog : Object {
    dynamic var name = ""
    dynamic var age = 0
}
