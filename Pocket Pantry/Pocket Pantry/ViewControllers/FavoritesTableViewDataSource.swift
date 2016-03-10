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
  
  var data: [Video]?
  
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell")
    // TODO: set up the cell
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data?.count ?? 0
  }
  
  // TODO: Implement editing the amount of information held in the
  
//  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//    return true
//  }
//  
//  func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//    return true
//  }
//  
//  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//    <#code#>
//  }
}
