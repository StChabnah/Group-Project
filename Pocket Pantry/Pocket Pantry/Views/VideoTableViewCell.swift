//
//  VideoTableViewCell.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import GradientView
import AFNetworking

class VideoTableViewCell: UITableViewCell {
  @IBOutlet var videoImageView: UIImageView!
  @IBOutlet var recipeNameLabel: UILabel!
  @IBOutlet var gradientViewContainer: UIView!
  
  var video: Video! {
    didSet {
      setupCell()
    }
  }
  
  func setupCell() {
    if let smallImage = video.getThumbnailURL(thumbnailSize: .Small) {
      videoImageView.setImageWithURL(smallImage)
    }
    if let mediumImage = video.getThumbnailURL(thumbnailSize: .Medium) {
      videoImageView.setImageWithURL(mediumImage)
    }
    if let highImage = video.getThumbnailURL(thumbnailSize: .ExtraHigh) {
      videoImageView.setImageWithURL(highImage)
    }
    
    recipeNameLabel.text = video.title
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    
    //videoImageView.clipsToBounds = true
    
    let gradientView = GradientView(frame: frame)
    let blackColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
    gradientView.colors = [blackColor, UIColor.clearColor()]
    gradientView.locations = [0.0, 0.7]
    gradientView.direction = .Horizontal
    gradientView.backgroundColor = UIColor.clearColor()
    gradientViewContainer.addSubview(gradientView)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    videoImageView.image = nil
    recipeNameLabel.text = nil
  }
}
