//
//  ViewController.swift
//  DogData
//
//  Created by Bruce Burgess on 2/28/16.
//  Copyright © 2016 Bruce Burgess. All rights reserved.
//

import UIKit
import RealmSwift //Import Realm

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    //connect the storyboard table view to code
    @IBOutlet weak var tableView: UITableView!
    
    var dogs : Results<Dog>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dogi = Dog()
        dogi.name = "Sean"
        dogi.age = 80
        
        //Setting up realm
        let realm = try! Realm()
        //Saving the dogi instance
        try! realm.write {
            realm.add(dogi)
        }
        
        self.dogs = realm.objects(Dog)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dogs!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dog = self.dogs![indexPath.row]
        cell.textLabel!.text = "\(dog.name) is \(dog.age) years old!"
        return cell
    }
    
    
}

