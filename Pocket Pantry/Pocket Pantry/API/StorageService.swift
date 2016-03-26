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
  
  func saveEntity(entity: Object, update: Bool) {
    saveEntities([entity], update: update)
  }
  
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
    }
  }
  
  internal func saveVideos(videos: List<Video>) {
    try! realm.write {
      for video in videos {
        if let videoFromRealm = retrieveEntity(Video.self, primaryKey: video.id ?? "") {
          video.favorite = videoFromRealm.favorite
        }
        realm.add(video, update: true)
      }
    }
  }
  
  func retrieveEntity<T: Object>(type: T.Type, primaryKey: AnyObject) -> T? {
    return realm.objectForPrimaryKey(type, key: primaryKey)
  }
  
  func retrieveEntitys<T: Object>(type: T.Type) -> Results<T> {
    return realm.objects(type)
  }
}