//
//  YoutubeAPI.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import Foundation
import youtube_ios_player_helper
import AFNetworking

class YoutubeAPI {
  
  // MARK: - Properties
  
  static var sharedInstance: YoutubeAPI = YoutubeAPI()
  
  internal var videos: [Video]?
  internal var apikey = "AIzaSyAP9jsq8LPcLSILNPblTjLi1mNcN5vkAWA"
  internal var username = "Tasty"
  
  // MARK: - Methods
  
//  init() {
    // TODO: Grab the videos from YouTube
//  }
  
  class func refreshVideoIDs() {
    let query = "https://www.googleapis.com/youtube/v3/channels?part=contentDetails&forUsername=\(sharedInstance.username)&key={\(sharedInstance.apikey)}"
    
  }
  
  func getVideos() -> [Video] {
    // TODO: Retrieve the videos from the API
    return videos!
  }
  
}
