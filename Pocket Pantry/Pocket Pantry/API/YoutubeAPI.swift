//
//  YoutubeAPI.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import Alamofire

class YoutubeAPI {
  
  // MARK: - Properties
  
  static var sharedInstance: YoutubeAPI = YoutubeAPI()
  
  internal var playlists: [Playlist]?
  internal var videos: [[Video]]?
  internal var apikey = "AIzaSyAP9jsq8LPcLSILNPblTjLi1mNcN5vkAWA"
  internal var channelTitle = "Tasty"
  
  internal var channelID = "UCJFp8uSYCjXOMnkUyb3CQ3Q"   // Channel ID retrieved from the Youtube API
  
  // MARK: - Methods
  
//  init() {
    // TODO: Grab the videos from YouTube
//  }
  
  func refreshVideoIDs() {
    // Query for the playlists in this channel
    var query = "https://www.googleapis.com/youtube/v3/playlists"//?part=contentDetails%2C+snippet&channelId=\(channelID)&key={\(apikey)}"
    let request = Alamofire.request(.GET, query, parameters: ["part":"contentDetails,snippet", "channelId":channelID, "key":apikey])
    print(request.request?.URL)
    request.responseJSON { (response) in
      if let items = (response.result.value as? NSDictionary)?["items"] as? NSArray {
        self.playlists = [Playlist]()
        for item in items {
          if let item = item as? NSDictionary {
            self.playlists?.append(Playlist(dict: item))
          }
        }
        for each in self.playlists! {
          print(each)
        }
      }
      else {
        print(response)
      }
      
      if let playlists = self.playlists {
        for playlist in playlists {
          query = "https://www.googleapis.com/youtube/v3/playlistItems"//?part=contentDetails%2C+snippet&playlistId=\(playlist.id)&key={\(apikey)}"
          if let playlistID = playlist.id {
            Alamofire.request(.GET, query, parameters: ["part":"contentDetails,snippet", "playlistId":playlistID, "key":self.apikey]).responseJSON(completionHandler: { (response) in
              if let items = (response.result.value as? NSDictionary)?["items"] as? NSArray {
                for item in items {
                  if let item = item as? NSDictionary {
                    playlist.addVideo(dict: item)
                  }
                }
                print(playlist.videos)
              }
              else {
                print(response)
              }
            })
          }
        }
      }
    }
  }
  
  func getVideos() -> [[Video]]? {
    // TODO: Retrieve the videos from the API
    return videos
  }
  
}
