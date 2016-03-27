//
//  PantryTableViewDataSource.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class PantryTableViewDataSource: NSObject, UITableViewDataSource {
  
  // MARK: - Properties
  
  let pantry = Pantry()
//  var pantry = [String]()
  
  
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PantryTableViewCell") as? PantryTableViewCell
    cell?.item = pantry.items?[indexPath.row]
  
    return cell!
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pantry.items?.count ?? 0
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      pantry.deleteAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
    }
  }
  
}
