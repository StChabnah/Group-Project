//
//  VideosViewController.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController, UISearchBarDelegate {

  // MARK: - Properties
  // MARK: Outlet
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet var searchBar: UISearchBar!
  
  var delegate: VideosTableViewDelegate!
  var dataSource: VideosTableViewDataSource!
  
  // MARK: - Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerNib(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
    
    delegate = VideosTableViewDelegate()
    delegate.controller = self
    dataSource = VideosTableViewDataSource()
    dataSource.controller = self
    
    tableView.delegate = delegate
    tableView.dataSource = dataSource
<<<<<<< HEAD
    
    dataSource.refreshData()
=======
    searchBar.delegate = self
  }
  
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    // TODO:
>>>>>>> origin/master
  }
}

