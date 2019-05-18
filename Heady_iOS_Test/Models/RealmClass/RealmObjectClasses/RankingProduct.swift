//
//  RankingProduct.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 18/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RankingProduct: Object {
    
    @objc dynamic var id = 0
    let view_count = RealmOptional<Int>()
    let order_count = RealmOptional<Int>()
    let shares = RealmOptional<Int>()

    override static func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["view_count","order_count","shares"]
    }
    

}
