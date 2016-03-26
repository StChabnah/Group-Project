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
  
  var data: [Playlist]?
  
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell") as? VideoTableViewCell
    cell?.video = data?[indexPath.section].videos[indexPath.row]
    
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data?[section].count ?? 0
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return data?.count ?? 0
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return data?[section].title
  }
  
  // MARK: Refreshing
  
  func refreshData() {
    YoutubeAPI.sharedInstance.refreshData { (playlists) in
      self.data = playlists
      self.controller.tableView.reloadData()
    }
  }
}
