//
//  VideoDetailViewController.swift
//  Pocket Pantry
//
//  Created by Chase McCoy on 3/25/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoDetailViewController: UIViewController {
  @IBOutlet var videoPlayerView: YTPlayerView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    videoPlayerView.loadVideoById("M7lc1UVf-VE", startSeconds: 0.0, endSeconds: 15.0, suggestedQuality: .Auto)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
