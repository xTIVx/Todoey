//
//  Category.swift
//  Todoey
//
//  Created by Igor Chernobai on 3/12/19.
//  Copyright © 2019 Igor Chernobai. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    
}
