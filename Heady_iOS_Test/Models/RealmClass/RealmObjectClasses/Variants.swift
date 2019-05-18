//
//  Variants.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 18/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Variants: Object {
    @objc dynamic var id = 0
    @objc dynamic var color : String?
    let price = RealmOptional<Double>()
    let size = RealmOptional<Int>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
