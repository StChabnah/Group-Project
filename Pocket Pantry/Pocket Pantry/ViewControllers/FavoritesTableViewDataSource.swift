//
//  FavoritesTableViewDataSource.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class FavoritesTableViewDataSource: NSObject, UITableViewDataSource {
  
  // MARK: - Properties
  
  var data: [Video] = StorageService.sharedInstance.retrieveFavoriteVideos()
  
  // MARK: - Methods
  
    func refreshData() {
        data = StorageService.sharedInstance.retrieveFavoriteVideos()
    }
    
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell") as? VideoTableViewCell 
    cell?.video = data[indexPath.row]
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count 
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
        StorageService.sharedInstance.toggleVideoFavoriteProperty(video: data[indexPath.row])
      data.removeAtIndex(indexPath.row)
    
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
    }
  }
}
