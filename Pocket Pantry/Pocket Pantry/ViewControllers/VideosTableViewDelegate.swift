//
//  VideosTableViewDelegate.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class VideosTableViewDelegate: NSObject, UITableViewDelegate {
  var controller: VideosViewController!
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    controller.performSegueWithIdentifier("VideoDetailViewController", sender: self)
  }
}
