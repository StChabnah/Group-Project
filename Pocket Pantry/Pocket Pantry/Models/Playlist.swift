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
  var videos: List<Video> = List<Video>()
  
  convenience init(dict: NSDictionary) {
    self.init()
    setUp(dict: dict)
  }
  
  func setUp(dict dict: NSDictionary) {
    id = dict["id"] as? String
    title = (dict["snippet"] as? NSDictionary)?["title"] as? String
    if let videoList = (dict["items"] as? NSArray) {
      for item in videoList{
        if let item = (item as? NSDictionary) {
          videos.append(Video(dict: item))
        }
      }
    }
  }
  
  func addVideo(dict dict: NSDictionary) {
    let video = Video(dict: dict)
    if !(video.title?.lowercaseString.containsString("private") ?? false) {
      videos.append(video)
    }
  }
  
  func delete(video video: Video) {
    var i = 0
    for each in videos {
      if each.id == video.id {
        videos.removeAtIndex(i)
        break
      }
      i += 1
    }
  }
  
  // Needed to tell Realm which key to use as the primary key
  override class func primaryKey() -> String {
    return "id"
  }
}