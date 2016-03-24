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
  
    var pantry = [String]()
    
  
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PantryTableViewCell")
    // TODO: set up the cell
    
        cell?.textLabel!.text = pantry[indexPath.row]
    
    
    return cell!
    
  }
  
    
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pantry.count ?? 0
  }
  
}
