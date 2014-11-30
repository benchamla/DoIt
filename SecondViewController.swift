//
//  SecondViewController.swift
//  DoIt
//
//  Created by ben on 28/11/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    
    
    @IBOutlet weak var ItemTextField: UITextField!
  
    
    
    @IBOutlet weak var UpdateLabel: UILabel!

    
    @IBAction func AddItemButton(sender: AnyObject) {
        
        toDoItems.append(ItemTextField.text)
        
        let FixedToDoItems = toDoItems
        
        NSUserDefaults.standardUserDefaults().setObject(FixedToDoItems, forKey: "todoItems")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        self.view.endEditing(true)
 
        UpdateLabel.text = "\(ItemTextField.text) added"
        ItemTextField.text = " " 
        
    
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    
    
}

