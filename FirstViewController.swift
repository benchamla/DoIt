//
//  FirstViewController.swift
//  DoIt
//
//  Created by ben on 28/11/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

import UIKit
var toDoItems: [String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tasksTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoItems.count
    }
    
  
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel.text = toDoItems[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if var storedToDoItem: AnyObject! = NSUserDefaults.standardUserDefaults().objectForKey("todoItems"){
            
            toDoItems = []
            toDoItems = storedToDoItem as [String]
        
        }
        tasksTable.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            
            toDoItems.removeAtIndex(indexPath.row)
            
            let FixedToDoItems = toDoItems
            
            NSUserDefaults.standardUserDefaults().setObject(FixedToDoItems, forKey: "todoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable.reloadData()
            
        }
        
    }
    
    
}

