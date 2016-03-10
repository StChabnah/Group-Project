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
  
  // MARK: - Methods
  
  init() {
    // TODO: Grab the videos from YouTube
  }
  
  class func refreshVideoIDs() {
    
  }
  
  func getVideos() -> [Video] {
    // TODO: Retrieve the videos from the API
    return videos!
  }
  
}
