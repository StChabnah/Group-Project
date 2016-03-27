//
//  PantryTableViewCell.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class PantryTableViewCell: UITableViewCell {
  
  var item: PantryItem? {
    didSet {
      textLabel?.text = item?.name
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
}
