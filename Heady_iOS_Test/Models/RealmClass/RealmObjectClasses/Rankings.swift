//
//  Rankings.swift
//  Heady_iOS_Test
//
//  Created by Monish Painter on 18/05/19.
//  Copyright © 2019 Monish Painter. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class Rankings: Object {
    @objc dynamic var ranking: String?
    let products = List<Products>()

    override static func primaryKey() -> String? {
        return "ranking"
    }

}
