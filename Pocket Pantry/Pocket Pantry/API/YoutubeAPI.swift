//
//  YoutubeAPI.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class YoutubeAPI {
  
  // MARK: - Properties
  
  static var sharedInstance: YoutubeAPI = YoutubeAPI()
  
  internal var playlists: [Playlist]?
  internal var videos: [[Video]]?
  internal var apikey = "AIzaSyAP9jsq8LPcLSILNPblTjLi1mNcN5vkAWA"
  internal var channelTitle = "Tasty"
  
  internal var channelID = "UCJFp8uSYCjXOMnkUyb3CQ3Q"   // Channel ID retrieved from the Youtube API
  
  // MARK: - Methods
  
  internal func refreshVideoIDs(completion: (() -> ())?) {
    // Query for the playlists in this channel
    var query = "https://www.googleapis.com/youtube/v3/playlists"//?part=contentDetails%2C+snippet&channelId=\(channelID)&key={\(apikey)}"
    Alamofire.request(
      .GET,
      query,
      parameters: ["part":"contentDetails,snippet", "channelId":channelID, "key":apikey]
      ).responseJSON { (response) in
        if let items = (response.result.value as? NSDictionary)?["items"] as? NSArray {
          self.playlists = [Playlist]()
          for item in items {
            if let item = item as? NSDictionary {
              self.playlists?.append(Playlist(dict: item))
            }
          }
        }
        else {
          print(response)
        }
        
        // For each playlist, pull down the videos for that playlist and save them to Realm
        if let playlists = self.playlists {
          var funcRunCount = 0
          for playlist in playlists {
            query = "https://www.googleapis.com/youtube/v3/playlistItems"//?part=contentDetails%2C+snippet&playlistId=\(playlist.id)&key={\(apikey)}"
            if let playlistID = playlist.id {
              Alamofire.request(
                .GET,
                query,
                parameters: ["part":"contentDetails,snippet", "playlistId":playlistID, "key":self.apikey, "maxResults":50]
                ).responseJSON(completionHandler: { (response) in
                  if let items = (response.result.value as? NSDictionary)?["items"] as? NSArray {
                    for item in items {
                      if let item = item as? NSDictionary {
                        playlist.addVideo(dict: item)
                      }
                    }
                  }
                  else {
                    print(response)
                  }
                  funcRunCount += 1
                  self.requestForVideosCompleted(funcRunCount: funcRunCount, finalCount: playlists.count, completion: completion)
                })
            }
          }
        }
      }
  }
  
  ///  Runs a piece of code if the funcRunCount equals the finalCount
  ///
  ///  - parameter funcRunCount: How many times has this method been called so far?
  ///  - parameter finalCount:   On which method call should the code be executed
  ///  - parameter completion:   The code to be executed
  ///
  /// - author: Nathan Ansel
  ///
  internal func requestForVideosCompleted(funcRunCount funcRunCount: Int, finalCount: Int, completion: (() -> ())?) {
    if funcRunCount == finalCount {
      StorageService.sharedInstance.saveEntities(self.playlists!, update: true)
      completion?()
    }
  }
  
  func getPlaylists() -> [Playlist] {
    var playlists = [Playlist]()
    for each in StorageService().retrieveEntitys(Playlist.self) {
      playlists.append(each)
    }
    return playlists
  }
  
  func refreshData(completion: (([Playlist]) -> ())?) {
    refreshVideoIDs {
      completion?(self.getPlaylists())
    }
  }
  
}
