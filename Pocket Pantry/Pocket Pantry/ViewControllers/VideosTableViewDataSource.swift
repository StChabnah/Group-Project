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
  var tempData: [Playlist]?
  var currentIngredientsVideos: [Video]?
  let pantry = StorageService.sharedInstance.retrieveEntity(Pantry.self, primaryKey: 0) ?? Pantry()
  // MARK: - Methods
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell") as? VideoTableViewCell
    if controller.filterSegmentedControl.selectedSegmentIndex == 0{
        if controller.searchBar.text == "" {
            cell?.video = data?[indexPath.section].videos[indexPath.row]
        }
        else {
            cell?.video = filteredData?[indexPath.section].videos[indexPath.row]
        }
    }
    else {
        if controller.searchBar.text == "" {
            cell?.video = currentIngredientsVideos![indexPath.row]
        }
        else {
            cell?.video = filteredData?[indexPath.section].videos[indexPath.row]
        }
    }
        return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if controller.filterSegmentedControl.selectedSegmentIndex == 0{
        
        if controller.searchBar.text == "" {
            return data?[section].videos.count ?? 0 }
        else {
            return filteredData?[section].videos.count ?? 0 }	
    }
    else{
        if controller.searchBar.text == "" {
            return currentIngredientsVideos!.count ?? 0
        }
        else{
            return filteredData?[section].videos.count ?? 0
        }
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    if controller.filterSegmentedControl.selectedSegmentIndex == 0{
        if controller.searchBar.text == "" {
            return data?.count ?? 0
        }
        
        else {
            return filteredData?.count ?? 0
        }
    }
    else {
        if controller.searchBar.text == "" {
            if currentIngredientsVideos!.count != 0{
                return 1
            }
            else{
                return 0
            }
        }
        else{
            return filteredData?.count ?? 0
        }
    }
}
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if controller.filterSegmentedControl.selectedSegmentIndex == 0{
        if controller.searchBar.text == "" {
            return data?[section].title
        } else {
            return filteredData?[section].title
        }
    }
    else{
        if controller.searchBar.text == ""{
            return "Ingredients I Have"
        }
        else{
            return filteredData?[section].title
        }
    }
  }
  
  func filterData(text text: String) {
    filteredData = [Playlist]()
    if controller.filterSegmentedControl.selectedSegmentIndex == 0{
     
        for playlist in data! {
            let filteredVideos = playlist.videos.filter({ (video: Video) -> Bool in
                if (video.title?.lowercaseString.containsString(text.lowercaseString) ?? false) {
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
    }
    else{
        let filteredVideos = currentIngredientsVideos!.filter({ (video: Video) -> Bool in
                if (video.title?.lowercaseString.containsString(text.lowercaseString) ?? false) {
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

  func filterCurrentRecipeData(){
    currentIngredientsVideos = [Video]()
    for item in pantry.items {
      for (pIndex, playlist) in tempData!.enumerate(){
        for (index, video) in playlist.videos.enumerate(){
          if video.videoDescription!.lowercaseString.containsString(item.name!.lowercaseString) ?? false {
            print(video.title!, item.name!)
            currentIngredientsVideos!.append(video)
            tempData![pIndex].delete(video: video)
          }
        }
      }
    }
    controller.tableView.reloadData()
  }
  
  // MARK: Refreshing
  
  func refreshData() {
    self.data = YoutubeAPI.sharedInstance.getPlaylists()
    self.tempData = YoutubeAPI.sharedInstance.getPlaylists()
    YoutubeAPI.sharedInstance.refreshData { (playlists) in
      self.data = playlists
      self.tempData = [Playlist]()
      for each in playlists {
        self.tempData?.append(Playlist())
        self.tempData?.last?.title = each.title
        for video in each.videos {
          self.tempData?.last?.videos.append(video)
        }
      }
      self.controller.tableView.reloadData()
    }
  }
}
