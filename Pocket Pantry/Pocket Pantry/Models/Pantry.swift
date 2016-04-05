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
  
  var items: List<PantryItem> = List<PantryItem>()
  var id: Int = 0
  
  func add(item item: PantryItem, index: Int) {
    items.insert(item, atIndex: index)
    StorageService.sharedInstance.saveEntity(item, update: true)
    StorageService.sharedInstance.saveEntity(self, update: true)
    print("added")
  }
  
  func append(item item: PantryItem) {
    items.append(item)
    StorageService.sharedInstance.saveEntity(item, update: true)
    StorageService.sharedInstance.saveEntity(self, update: true)
    print("appended")
  }
  
  func deleteAtIndex(index: Int) {
    if let itemFromRealm = StorageService.sharedInstance.retrieveEntity(PantryItem.self, primaryKey: items[index].name ?? "") {
      StorageService.sharedInstance.deleteEntity(itemFromRealm)
    }
    items.removeAtIndex(index)
    StorageService.sharedInstance.saveEntity(self, update: true)
  }
  
  func delete(item item: PantryItem) {
    for i in 0...items.count {
      if items[i] == item {
        items.removeAtIndex(i)
        break
      }
    }
    StorageService.sharedInstance.saveEntity(self, update: true)
  }
  
  // Needed to tell Realm which key to use as the primary key
  override class func primaryKey() -> String {
    return "id"
  }
}
