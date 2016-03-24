//
//  NewPantryItemViewController.swift
//  Pocket Pantry
//
//  Created by Abby  Bassie on 3/23/16.
//  Copyright © 2016 StChabnah. All rights reserved.
//

import UIKit

class NewPantryItemViewController: UIViewController {
    var dataSource: PantryTableViewDataSource!
    

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = PantryTableViewDataSource()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func navPop(sender: AnyObject) {
        dataSource.pantry.append(textField.text!)
        print(dataSource.pantry[0])
        
        navigationController?.popViewControllerAnimated(true)
    }
    
  
}
