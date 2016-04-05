//
//  VideosTableViewDataSource.swift
//  Pocket Pantry
//
//  Created by Nathan Ansel on 3/9/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit
import GradientView

class VideosTableViewDataSource: NSObject, UITableViewDataSource {
  var controller: VideosViewController!

  // MARK: - Properties
  
  var data: [Playlist]?
  var filteredData: [Playlist]?
  
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell") as? VideoTableViewCell
    if controller.searchBar.text == "" {
       cell?.video = data?[indexPath.section].videos[indexPath.row]
        
    }
    else {
        cell?.video = filteredData?[indexPath.section].videos[indexPath.row] }
        return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if controller.searchBar.text == "" {
        return data?[section].videos.count ?? 0 }
    else {
        return filteredData?[section].videos.count ?? 0 }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    if controller.searchBar.text == "" {
        return data?.count ?? 0
    } else {
    return filteredData?.count ?? 0 }
    }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if controller.searchBar.text == "" {
      return data?[section].title
    } else {
        return filteredData?[section].title
    }
  }
  
  func filterData(text text: String) {
    filteredData = [Playlist]()
    for playlist in data! {
      let filteredVideos = playlist.videos.filter({ (video: Video) -> Bool in
        if (video.title?.containsString(text) ?? false) {
          return true
        }
        return false
      })
      let filteredPlaylist = Playlist()
      for video in filteredVideos {
        filteredPlaylist.videos.append(video)
      }
      filteredData?.append(filteredPlaylist)
    }
    controller.tableView.reloadData()
  }
  
  // MARK: Refreshing
  
  func refreshData() {
    self.data = YoutubeAPI.sharedInstance.getPlaylists()
    YoutubeAPI.sharedInstance.refreshData { (playlists) in
      self.data = playlists
      self.controller.tableView.reloadData()
    }
  }
}
