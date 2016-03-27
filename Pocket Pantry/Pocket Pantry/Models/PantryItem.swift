//
//  PantryItem.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import RealmSwift

class PantryItem: Object {
  
  dynamic var name: String?
  
  convenience init(name: String?) {
    self.init()
    self.name = name
  }
  
  // Needed to tell Realm which key to use as the primary key
  override class func primaryKey() -> String {
    return "name"
  }
}