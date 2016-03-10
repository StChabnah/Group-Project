//
//  VideoTableViewCell.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import GradientView

class VideoTableViewCell: UITableViewCell {
  @IBOutlet var videoImageView: UIImageView!

  override func awakeFromNib() {
    super.awakeFromNib()
    
    videoImageView.image = UIImage(imageLiteral: "sexy")
        
    let gradientView = GradientView(frame: frame)
    gradientView.colors = [UIColor.blackColor(), UIColor.clearColor()]
    gradientView.locations = [0.0, 0.7]
    gradientView.direction = .Horizontal
    gradientView.backgroundColor = UIColor.clearColor()
    addSubview(gradientView)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
}
