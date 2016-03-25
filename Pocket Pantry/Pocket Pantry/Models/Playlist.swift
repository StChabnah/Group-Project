//
//  Playlist.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/25/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation

class Playlist {
  
  var id: String?
  var title: String?
  var count: Int?
  var videos: [Video]?
  
  init(dict: NSDictionary) {
    setUp(dict: dict)
  }
  
  func setUp(dict dict: NSDictionary) {
    id = dict["id"] as? String
    title = (dict["snippet"] as? NSDictionary)?["title"] as? String
    if let details = dict["contentDetails"] as? NSDictionary {
      count = details["itemCount"] as? Int
    }
    if let videoList = (dict["items"] as? NSArray) {
      videos = [Video]()
      for item in videoList{
        if let item = (item as? NSDictionary) {
          videos?.append(Video(dict: item))
        }
      }
    }
  }
  
  func addVideo(dict dict: NSDictionary) {
    if videos == nil {
      videos = [Video]()
    }
    videos!.append(Video(dict: dict))
  }
}