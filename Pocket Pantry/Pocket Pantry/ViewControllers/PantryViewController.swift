//
//  PantryViewController.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class PantryViewController: UIViewController {

  // MARK: - Properties
  
  @IBOutlet weak var tableView: UITableView!
  
  var delegate: PantryTableViewDelegate!
  var dataSource: PantryTableViewDataSource!
  
  // MARK: - Methods
    
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated);
    self.tableView.reloadData()
    
    if let dataSource = dataSource {
      print(dataSource.pantry)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.reloadData()
    // Do any additional setup after loading the view, typically from a nib.
    
    delegate = PantryTableViewDelegate()
    dataSource = PantryTableViewDataSource()
    
    tableView.delegate = delegate
    tableView.dataSource = dataSource
    
    print(dataSource.pantry)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let vc = segue.destinationViewController as! NewPantryItemViewController
    vc.pantryTableView = self
  }
}
