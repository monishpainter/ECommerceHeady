//
//  Tax.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 18/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Tax: Object {
    @objc dynamic var name : String?
    let value = RealmOptional<Double>()
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
