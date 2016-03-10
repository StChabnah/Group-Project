//
//  FavoritesViewController.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

  // MARK: - Properties
  
  @IBOutlet weak var tableView: UITableView!
  
  var delegate: FavoritesTableViewDelegate!
  var dataSource: FavoritesTableViewDataSource!
  
  // MARK: - Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    delegate = FavoritesTableViewDelegate()
    dataSource = FavoritesTableViewDataSource()
    
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }
  
}
