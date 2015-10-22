//
//  ViewController.swift
//  RealmMigration
//
//  Created by perwyl on 22/10/15.
//  Copyright © 2015 algoaccess. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var btnAddCustomer: UIButton!
    
    
    @IBOutlet weak var btnMigrateToV1: UIButton!
    
    @IBOutlet weak var v0Customer: UITextView!
    
    @IBOutlet weak var v1Customer: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    Add Customer for v0
    
    - parameter sender: <#sender description#>
    */
    @IBAction func addCustomer(sender: AnyObject) {
        
        let customer = Customer()
        //v0
        customer.firstName = "perwyl " + customer.pKey
        
        //v1
        //customer.firstName = StringTimestamp(newValue: "Julian")
        
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(customer, update: true)
        }
        
    }
    
    

    @IBAction func perforMigration(sender: AnyObject) {
        
    }

}

