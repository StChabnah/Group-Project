//
//  Video.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import RealmSwift

enum ThumbnailQuality {
  /// height = 90
  /// width = 120
  case Small
  
  /// height = 180
  /// width = 320
  case Medium
  
  /// height = 360
  /// width = 480
  case High
  
  /// height = 480
  /// width = 640
  case ExtraHigh
  
  /// height = 720
  /// width = 1280
  case MaxResolution
}

class Video: Object {
  
  dynamic var id: String?
  dynamic var videoID: String?
  dynamic var title: String?
  dynamic var videoDescription: String?
  dynamic var publishDate: NSDate?
  dynamic var favorite: Bool = false
  
  dynamic internal var defaultThumbnailURL: String?
  dynamic internal var mediumThumbnailURL: String?
  dynamic internal var highThumbnailURL: String?
  dynamic internal var standardThumbnailURL: String?
  dynamic internal var maxresThumbnailURL: String?
  
//  dynamic var ingredients: List<String> = List<String>()
  
  convenience init(dict: NSDictionary) {
    self.init()
    id = dict["id"] as? String
    if let snippet = dict["snippet"] as? NSDictionary {
      videoID = (snippet["resourceId"] as? NSDictionary)?["videoId"] as? String
      title = snippet["title"] as? String
      videoDescription = snippet["description"] as? String
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-ddThh:mm:ss.SSSZ" // 2016-03-23T22:30:42.000Z http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
      publishDate = formatter.dateFromString(snippet["publishedAt"] as? String ?? "")
      if let thumbnails = snippet["thumbnails"] as? NSDictionary {
        defaultThumbnailURL  = (thumbnails["default"] as? NSDictionary)?["url"] as? String
        mediumThumbnailURL   = (thumbnails["medium"] as? NSDictionary)?["url"] as? String
        highThumbnailURL     = (thumbnails["high"] as? NSDictionary)?["url"] as? String
        standardThumbnailURL = (thumbnails["standard"] as? NSDictionary)?["url"] as? String
        maxresThumbnailURL   = (thumbnails["maxres"] as? NSDictionary)?["url"] as? String
      }
    }
  }
  
  ///  Returns either the URL of the thumbnail size provided, or the URL of the 
  ///    next smallest thumbnail that is avalible.
  ///
  ///  - parameter thumbnailSize: The size of the thumbnail desired, expressed
  ///                             with a ThumbnailQuality value.
  ///
  ///  - returns: An NSURL? of the thumbnail desired, or the next smallest not nil
  ///               thumbnail URL
  ///
  /// - author: Nathan Ansel
  ///
  func getThumbnailURL(thumbnailSize size: ThumbnailQuality) -> NSURL? {
    var getNextSmallest = false
    if size == .MaxResolution {
      if let url = NSURL(string: maxresThumbnailURL ?? "") {
        return url
      }
      getNextSmallest = true
    }
    if size == .ExtraHigh || getNextSmallest {
      if let url = NSURL(string: standardThumbnailURL ?? "") {
        return url
      }
      getNextSmallest = true
    }
    if size == .High || getNextSmallest {
      if let url = NSURL(string: highThumbnailURL ?? "") {
        return url
      }
      getNextSmallest = true
    }
    if size == .Medium || getNextSmallest {
      if let url = NSURL(string: mediumThumbnailURL ?? "") {
        return url
      }
      getNextSmallest = true
    }
    if size == .Small || getNextSmallest {
      return NSURL(string: defaultThumbnailURL ?? "")
    }
    return nil
  }
  
  func getIngredients() -> [String] {
    return [""]
  }
  
  // Needed to tell Realm which key to use as the primary key
  override class func primaryKey() -> String {
    return "id"
  }
}