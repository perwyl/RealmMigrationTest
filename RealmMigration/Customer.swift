//
//  Customer.swift
//  RealmMigration
//
//  Created by perwyl on 22/10/15.
//  Copyright © 2015 algoaccess. All rights reserved.
//

import Foundation
import RealmSwift

class Customer: Object {
    
    //v0
    var firstName: String = ""
    
    //v1
   // dynamic var firstName: StringTimestamp!
    
    var pKey = NSUUID().UUIDString
    
    override static func primaryKey() -> String? {
        return "pKey"
    }
}