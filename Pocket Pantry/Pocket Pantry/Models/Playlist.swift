//
//  Playlist.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/25/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import RealmSwift

class Playlist: Object {
  
  dynamic var id: String?
  dynamic var title: String?
  dynamic var count: Int = 0
  var videos: List<Video> = List<Video>()
  
  convenience init(dict: NSDictionary) {
    self.init()
    setUp(dict: dict)
  }
  
  func setUp(dict dict: NSDictionary) {
    id = dict["id"] as? String
    title = (dict["snippet"] as? NSDictionary)?["title"] as? String
    if let details = dict["contentDetails"] as? NSDictionary {
      count = details["itemCount"] as? Int ?? 0
    }
    if let videoList = (dict["items"] as? NSArray) {
      for item in videoList{
        if let item = (item as? NSDictionary) {
          videos.append(Video(dict: item))
        }
      }
    }
  }
  
  func addVideo(dict dict: NSDictionary) {
    videos.append(Video(dict: dict))
  }
  
  // Needed to tell Realm which key to use as the primary key
  override class func primaryKey() -> String {
    return "id"
  }
}