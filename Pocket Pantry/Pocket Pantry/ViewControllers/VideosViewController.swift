//
//  VideosViewController.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController {

  // MARK: - Properties
  // MARK: Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  var delegate: VideosTableViewDelegate!
  var dataSource: VideosTableViewDataSource!
  
  // MARK: - Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerNib(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoTableViewCell")
    
    delegate = VideosTableViewDelegate()
    dataSource = VideosTableViewDataSource()
    
    tableView.delegate = delegate
    tableView.dataSource = dataSource
  }
}

