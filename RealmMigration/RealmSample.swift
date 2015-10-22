//
//  RealmSample.swift
//  RealmMigration
//
//  Created by perwyl on 22/10/15.
//  Copyright © 2015 algoaccess. All rights reserved.
//

import Foundation
import RealmSwift

class RealmSample {
    
    func getRealmPath() -> String {
        let realmName =  ("perwyl.realm")
        let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        return documents.stringByAppendingPathComponent(realmName)
    }
    
    func updateRealm(){
        
        Realm.Configuration.defaultConfiguration.path = getRealmPath()

        
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
          
                migration.create("StringTimestamp", value: [ "value": "",  "createdAt": NSDate() ])
                
                if (oldSchemaVersion < 1) {
                    migration.enumerate(Customer.className()){oldObject, newObject in
                        
                        let firstName = oldObject!["firstName"] as? String
                        
                        print(firstName)
                        
                        let firstNameTimeStamp =  StringTimestamp(newValue: firstName)
                        
                        migration.create("StringTimestamp", value: firstNameTimeStamp)
                        newObject!["firstName"] = firstNameTimeStamp
                    }
                   
                }
        })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        
        print(Realm.Configuration.defaultConfiguration)
        // Now that we've told Realm how to handle the schema change, opening the file
        // will automatically perform the migration
        let realm = try! Realm()
    }

    
}