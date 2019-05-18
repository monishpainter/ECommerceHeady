//
//  Categories.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 18/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Categories: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let products = List<Products>()
    let child_categories = List<Int>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["name"]
    }
}
