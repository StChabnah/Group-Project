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
  @IBOutlet var recipeDescriptionLabel: UILabel!
  @IBOutlet var gradientViewContainer: UIView!
  
  var video: Video! {
    didSet {
      setupCell()
    }
  }
  
  func setupCell() {
    videoImageView.setImageWithURL(NSURL(string: video.mediumThumbnailURL!)!)
    recipeNameLabel.text = video.title
    recipeDescriptionLabel.text = video.videoDescription
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    
    videoImageView.clipsToBounds = true
    
    let gradientView = GradientView(frame: frame)
    let blackColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
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
    recipeDescriptionLabel.text = nil
  }
}
