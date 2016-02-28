//
//  AddDogViewController.swift
//  DogData
//
//  Created by Bruce Burgess on 2/28/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import RealmSwift

class AddDogViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //Connected to storyboard
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.picker.dataSource = self
        self.picker.delegate = self
    }
    
    //Setting how many rows in the picker view
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    //Sets the number of components in the picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    //Returns what is displayed in the picker view
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
        
    }

    @IBAction func saveTapped(sender: AnyObject) {
        let dogAge = self.picker.selectedRowInComponent(0)
        let dogName = self.nameTextField.text!
        
        let dog = Dog()
        dog.name = dogName
        dog.age = dogAge
        
        //Setting up realm
        let realm = try! Realm()
        //Saving the dogi instance
        try! realm.write {
            realm.add(dog)
        }

        self.navigationController?.popViewControllerAnimated(true)
        
    }

}
