//
//  Item.swift
//  Todoey
//
//  Created by Igor Chernobai on 2/18/19.
//  Copyright © 2019 Igor Chernobai. All rights reserved.
//

import Foundation


class Item: Encodable, Decodable{
    var title = ""
    var done = false
}
