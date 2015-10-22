//
//  StringTimestamp.swift
//  RealmMigration
//
//  Created by perwyl on 22/10/15.
//  Copyright © 2015 algoaccess. All rights reserved.
//

import Foundation
import RealmSwift

class StringTimestamp: Object {
    
    var value: String = ""
    var createdAt = NSDate()
    
    convenience required init(newValue _newValue: String?){
        self.init()
        
        var thisValue = " "
        
        if _newValue != nil {
            thisValue = _newValue!
        }
        
        value = thisValue
        createdAt = NSDate()
    }
    
}