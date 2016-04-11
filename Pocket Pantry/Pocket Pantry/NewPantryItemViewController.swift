//
//  NewPantryItemViewController.swift
//  Pocket Pantry
//
//  Created by Abby  Bassie on 3/23/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class NewPantryItemViewController: UIViewController {
  var pantryTableView: PantryViewController!

  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func navPop(sender: AnyObject) {
    if textField.text != "" {
      pantryTableView.dataSource.pantry.append(item: PantryItem(name: textField.text))
        
    }
    navigationController?.popViewControllerAnimated(true)
  }
    
  
}
