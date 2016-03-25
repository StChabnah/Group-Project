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
    var query = "https://www.googleapis.com/youtube/v3/playlists?part=contentDetails%2C+snippet&channelId=\(channelID)&key={\(apikey)}"
    Alamofire.request(.GET, query).responseJSON { (response) in
      if let response = response as? NSDictionary {
        print(response)
      }
      else {
        print(response)
      }
    }
    
    if let playlists = playlists {
      for playlist in playlists {
        query = "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails%2C+snippet&playlistId=\(playlist.id)&key={\(apikey)}"
        // TODO: Add query accessing stuff
      }
    }
    
  }
  
  func getVideos() -> [[Video]]? {
    // TODO: Retrieve the videos from the API
    return videos
  }
  
}
