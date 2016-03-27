//
//  Pantry.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation

class Pantry {
  
  static let sharedInstance: Pantry = Pantry()
  
  var items: [PantryItem]? {
    didSet {
      
    }
  }
  
  init() {
    items = [PantryItem]()
    let toItems = StorageService.sharedInstance.retrieveEntitys(PantryItem.self)
    for item in toItems {
      items?.append(item)
    }
  }
  
  func add(item item: PantryItem, index: Int) {
    StorageService.sharedInstance.saveEntity(item, update: true)
    items?.insert(item, atIndex: index)
  }
  
  func append(item item: PantryItem) {
    StorageService.sharedInstance.saveEntity(item, update: true)
    items?.append(item)
  }
  
  func deleteAtIndex(index: Int) {
    if let itemFromRealm = StorageService.sharedInstance.retrieveEntity(PantryItem.self, primaryKey: items?[index].name ?? "") {
      StorageService.sharedInstance.deleteEntity(itemFromRealm)
    }
    items?.removeAtIndex(index)
  }
  
  func delete(item item: PantryItem) {
    for i in 0...(items?.count ?? 0) {
      if items?[i] == item {
        items?.removeAtIndex(i)
        break
      }
    }
  }
}
