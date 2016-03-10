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
  @IBOutlet var recipeNameLabel: UILabel!
  @IBOutlet var recipeDescriptionLabel: UILabel!
  @IBOutlet var gradientViewContainer: UIView!

  override func awakeFromNib() {
    super.awakeFromNib()
    
    videoImageView.image = UIImage(imageLiteral: "sexy")
    
    recipeDescriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
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
  }
}
