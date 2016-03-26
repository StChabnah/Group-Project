//
//  VideoDetailViewController.swift
//  Pocket Pantry
//
//  Created by Chase McCoy on 3/25/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoDetailViewController: UIViewController, YTPlayerViewDelegate {
  @IBOutlet var videoPlayerView: YTPlayerView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var containerView: UIView!
  @IBOutlet var scrollViewHeightConstraint: NSLayoutConstraint!
  
  var video: Video! {
    didSet {
      setupVideoPlayer(withVideoID: video.videoID!)
      titleLabel.text = video.title
      descriptionLabel.text = video.videoDescription
    }
  }
  
  // TODO:
  // https://github.com/youtube/youtube-ios-player-helper/issues/48
  // https://github.com/youtube/youtube-ios-player-helper/issues/29

  override func viewDidLoad() {
    super.viewDidLoad()
    
    videoPlayerView.delegate = self
  }
  
  override func viewDidLayoutSubviews() {
    scrollViewHeightConstraint.constant = titleLabel.sizeThatFits(titleLabel.frame.size).height + descriptionLabel.sizeThatFits(descriptionLabel.frame.size).height + 50
  }
  
  func setupVideoPlayer(withVideoID videoID: String) {
    let width = NSString(format: "0.00f", view.frame.size.width)
    let height = NSString(format: "0.00f", videoPlayerView.frame.size.height)
    let playerVars = ["playsinline": 1, "modestbranding": 1, "width": width, "height": height]
    videoPlayerView.loadWithVideoId(videoID, playerVars: playerVars)
  }
  
  func playerView(playerView: YTPlayerView, didChangeToState state: YTPlayerState) {
  }
  
  func playerViewPreferredWebViewBackgroundColor(playerView: YTPlayerView) -> UIColor {
    return UIColor.blackColor()
  }
  
  func playerViewDidBecomeReady(playerView: YTPlayerView) {
    playerView.playVideo()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
