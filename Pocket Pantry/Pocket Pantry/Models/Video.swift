//
//  Video.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class Video {
  
  var name: String?
  var length: CGFloat?
  var videoDescription: String?
  
  init(dict: NSDictionary) {
    name = dict[""] as? String
    videoDescription = dict[""] as? String
  }
}