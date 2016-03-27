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
    controller.performSegueWithIdentifier("VideoDetailViewController", sender: controller.tableView.cellForRowAtIndexPath(indexPath))
  }
  
  func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    view.tintColor = UIColor.blackColor()
    
    let header = view as! UITableViewHeaderFooterView
    header.textLabel?.textColor = UIColor.whiteColor()
  }
}
