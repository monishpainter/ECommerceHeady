//
//  Products.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 18/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Products: Object {
    @objc dynamic var id = 0
    @objc dynamic var name : String?
    @objc dynamic var date_added : String?
   
    let variants = List<Variants>()
    @objc dynamic var tax: Tax? // to-one relationships must be optional
    let view_count = RealmOptional<Int>()
    let order_count = RealmOptional<Int>()
    let shares = RealmOptional<Int>()

    override class func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["view_count","order_count","shares"]
    }

}
