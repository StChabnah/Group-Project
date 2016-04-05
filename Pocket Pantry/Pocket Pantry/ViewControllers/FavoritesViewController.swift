//
//  FavoritesViewController.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
  @IBOutlet var editButton: UIBarButtonItem!

  // MARK: - Properties
  
  @IBOutlet weak var tableView: UITableView!
  
  var delegate: FavoritesTableViewDelegate!
  var dataSource: FavoritesTableViewDataSource!
  
  // MARK: - Methods
    
    override func viewWillAppear(animated: Bool) {
        dataSource.refreshData()
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerNib(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
    
    delegate = FavoritesTableViewDelegate()
    dataSource = FavoritesTableViewDataSource()
    
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }
  
  @IBAction func editButtonPressed(sender: UIBarButtonItem) {
    if(tableView.editing == true) {
      tableView.setEditing(false, animated: true)
      sender.title = "Edit"
    }
    else {
      tableView.setEditing(true, animated: true)
      sender.title = "Done"
    }
  }
}
