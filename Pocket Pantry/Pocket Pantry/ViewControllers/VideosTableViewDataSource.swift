//
//  VideosTableViewDataSource.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import GradientView

class VideosTableViewDataSource: NSObject, UITableViewDataSource {
  var controller: VideosViewController!

  // MARK: - Properties
  
  var data: [Video]?
  
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell")
    // TODO: set up the cell
    
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20//data?.count ?? 0
  }
  
  // MARK: Refreshing
  
  func refreshData() {
    YoutubeAPI.sharedInstance.refreshVideoIDs()
  }
}
