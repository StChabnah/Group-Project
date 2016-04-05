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
            realm.add(item, update: update)
          }
        }
        for item in entities {
          saveVideos(item.videos)
        }
      }
      else {
        try! realm.write {
          for item in entities {
            realm.add(item)
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
        if let videoFromRealm = retrieveEntity(Video.self, primaryKey: video.id ?? "") {
          video.favorite = videoFromRealm.favorite
        }
        if !(video.title?.lowercaseString.containsString("private") ?? false) {
          realm.add(video, update: true)
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
      print("Unable to delete \(entity)")
    }
  }
}