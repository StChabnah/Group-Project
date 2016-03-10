//
//  FavoritesViewController.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var delegate: FavoritesTableViewDelegate!
  var dataSource: FavoritesTableViewDataSource!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerNib(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
    
    delegate = FavoritesTableViewDelegate()
    dataSource = FavoritesTableViewDataSource()
    
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }
  
}
