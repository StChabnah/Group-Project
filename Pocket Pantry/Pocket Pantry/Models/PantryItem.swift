//
//  PantryItem.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation

class PantryItem {
  
  var name: String?
  var number: Int?
  
  convenience init(name: String?, number: Int?) {
    self.init()
    self.name = name
    self.number = number
  }
}