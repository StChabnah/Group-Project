//
//  Pantry.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import RealmSwift

class Pantry: Object {
  
  // MARK: - Properties
  
  var items: List<PantryItem> = List<PantryItem>()
  var id: Int = 0
  
  // MARK: - Methods
  
  // MARK: Adding
  
  func add(item item: PantryItem, index: Int) {
    StorageService.sharedInstance.addItemToPantry(pantry: self, item: item, index: index)
  }
  
  func append(item item: PantryItem) {
    StorageService.sharedInstance.appendItemToPantry(pantry: self, item: item)
  }
  
  // MARK: Deleting
  
  func deleteAtIndex(index: Int) {
    StorageService.sharedInstance.deleteFromPantryAtIndex(pantry: self, index: index)
  }
  
  func delete(item item: PantryItem) {
    StorageService.sharedInstance.deleteItemFromPantry(pantry: self, item: item)
  }
  
  // MARK: Realm Stuff
  
  // Needed to tell Realm which key to use as the primary key
  override class func primaryKey() -> String {
    return "id"
  }
}
