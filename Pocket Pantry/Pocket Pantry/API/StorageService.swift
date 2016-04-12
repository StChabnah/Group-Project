//
//  StorageService.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/25/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import RealmSwift

class StorageService {
  
  static let sharedInstance: StorageService = StorageService()
  
  internal let realm = try! Realm()
  
  ///  Saves a specific entity into the Realm database.
  ///
  /// - parameter entity: The object to be saved.
  /// - parameter update: Whether to update the object in the database or overwrite it.
  ///
  /// - author: Nathan Ansel
  ///
  func saveEntity(entity: Object, update: Bool) {
    saveEntities([entity], update: update)
  }
  
  ///  Saves multiple entities into the Realm database.
  ///
  /// - parameter entities: The objects to be saved.
  /// - parameter update:   Whether to update the originals in the database or overwrite them.
  ///
  /// - author: Nathan Ansel
  ///
  func saveEntities(entities: [Object], update: Bool) {
    if let entities = entities as? [Video] {
      saveVideos(List<Video>(entities))
    } else {
      if let entities = entities as? [Playlist] {
        try! realm.write {
          for item in entities {
            for video in item.videos {
              if let videoFromRealm = StorageService.sharedInstance.retrieveEntity(Video.self, primaryKey: video.videoID ?? "") {
                video.favorite = videoFromRealm.favorite
              }
            }
            realm.add(item, update: update)
          }
        }
      }
      else {
        try! realm.write {
          for item in entities {
            realm.add(item, update: update)
          }
        }
      }
    }
  }
  
  ///  Saves Video objects into the Realm database without distructing the
  ///    `favorite` property.
  ///
  /// - parameter videos: A List<> of Video objects to be saved.
  ///
  /// - author: Nathan Ansel
  ///
  internal func saveVideos(videos: List<Video>) {
    try! realm.write {
      for video in videos {
        if let videoFromRealm = retrieveEntity(Video.self, primaryKey: video.videoID ?? "") {
          video.favorite = videoFromRealm.favorite
        }
        else {
          if !(video.title?.lowercaseString.containsString("private") ?? false) {
            realm.add(video, update: true)
          }
        }
      }
    }
  }
  
  ///  Retrieves an entity of a particular type with a primary key.
  ///
  ///  - parameter type:       The type of object (ex. Video.self)
  ///  - parameter primaryKey: The primary key to match.
  ///
  ///  - returns: An object or nil.
  ///
  /// - author: Nathan Ansel
  ///
  func retrieveEntity<T: Object>(type: T.Type, primaryKey: AnyObject) -> T? {
    return realm.objectForPrimaryKey(type, key: primaryKey)
  }
  
  ///  Retrieves a list of entities of a particular type.
  ///
  ///  - parameter type: The type of object (ex. Video.self)
  ///
  ///  - returns: A Results<> list full of the results. (length is 0 if no objects returned)
  ///
  /// - author: Nathan Ansel
  ///
  func retrieveEntitys<T: Object>(type: T.Type) -> Results<T> {
    return realm.objects(type)
  }
  
  ///  Retrieves a list of videos that have been favorited.
  ///
  ///  - returns: An array of Videos. If no videos have been favorited yet returns
  ///             an empty array.
  ///
  func retrieveFavoriteVideos() -> [Video] {
    var videos = [Video]()
    let retrievedVideos = StorageService.sharedInstance.retrieveEntitys(Video.self)
    for video in retrievedVideos {
      if video.favorite {
        videos.append(video)
      }
    }
    return videos
  }
  
  ///  Toggles the favorite property of a Video.
  ///
  ///  - parameter video: The video to be toggled.
  ///
  func toggleVideoFavoriteProperty(video video: Video) {
    if let video = StorageService.sharedInstance.retrieveEntity(Video.self, primaryKey: video.videoID ?? "") {
      try! realm.write {
        if video.favorite == false {
          video.favorite = true
        }
        else {
          video.favorite = false
        }
      }
    }
    else {
      print("video not found in realm")
    }
  }
  
  ///  Removes an entity from the database.
  ///
  ///  - parameter entity: The object to be deleted.
  ///
  /// - author: Nathan Ansel
  ///
  func deleteEntity(entity: Object) {
    do {
      try realm.write {
        realm.delete(entity)
      }
    }
    catch {
      print("Unable to delete \(entity) ¯\\_(ツ)_/¯")
    }
  }
  
  // MARK: - Pantry
  
  func appendItemToPantry(pantry pantry: Pantry, item: PantryItem) {
    for each in pantry.items {
      if item.name == each.name {
        return
      }
    }
    if let pantry = retrieveEntity(Pantry.self, primaryKey: pantry.id) {
      try! realm.write {
        if let itemFromRealm = retrieveEntity(PantryItem.self, primaryKey: item.name ?? "") {
          pantry.items.append(itemFromRealm)
        }
        else {
          pantry.items.append(item)
        }
      }
      saveEntity(item, update: true)
      saveEntity(pantry, update: true)
    }
    else {
      pantry.items.append(item)
      saveEntity(item, update: true)
      saveEntity(pantry, update: true)
    }
  }
  
  func addItemToPantry(pantry pantry: Pantry, item: PantryItem, index: Int) {
    for each in pantry.items {
      if item.name == each.name {
        return
      }
    }
    if let pantry = retrieveEntity(Pantry.self, primaryKey: pantry.id) {
      try! realm.write {
        pantry.items.insert(item, atIndex: index)
      }
      saveEntity(item, update: true)
      saveEntity(pantry, update: true)
    }
    else {
      pantry.items.insert(item, atIndex: index)
      saveEntity(item, update: true)
      saveEntity(pantry, update: true)
    }
  }
  
  func deleteFromPantryAtIndex(pantry pantry: Pantry, index: Int) {
    if let pantry = retrieveEntity(Pantry.self, primaryKey: pantry.id) {
      let tempItem = pantry.items[index]
      try! realm.write {
        pantry.items.removeAtIndex(index)
      }
      deleteEntity(tempItem)
      saveEntity(pantry, update: true)
    }
    else {
      pantry.items.removeAtIndex(index)
      saveEntity(pantry, update: true)
    }
  }
  
  func deleteItemFromPantry(pantry pantry: Pantry, item: PantryItem) {
    if let pantry = retrieveEntity(Pantry.self, primaryKey: pantry.id) {
      for i in 0...pantry.items.count {
        if pantry.items[i].name == item.name {
          let tempItem = pantry.items[i]
          try! realm.write {
            pantry.items.removeAtIndex(i)
          }
          deleteEntity(tempItem)
          break
        }
      }
    }
    else {
      for i in 0...pantry.items.count {
        if pantry.items[i].name == item.name {
          pantry.items.removeAtIndex(i)
          break
        }
      }
    }
  }
}