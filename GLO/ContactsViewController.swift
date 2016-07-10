//
//  ContactsViewController.swift
//  GLO
//
//  Created by Toph on 7/9/16.
//  Copyright © 2016 SpaceBoat Development LLC. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = ["Jane", "Dick", "Larry"]
    
    @IBOutlet weak var contactsTableview: UITableView!
    
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        let navItem = self.navigationItem
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(doneButton))
        
        navItem.title = "Add Contacts"
        navItem.rightBarButtonItem = doneBtn
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: DELEGATE METHODS
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("contactcell") as? ContactsTableViewCell
        
        if (cell == nil) {
            let nib:NSArray = NSBundle.mainBundle().loadNibNamed("ContactsTableViewCell", owner:self, options:nil)
            cell = nib.objectAtIndex(0) as? ContactsTableViewCell
        }
        
        cell!.textLabel?.text = data[indexPath.row]
        
        print("in cellforrowatindexpath - contacts")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        data[indexPath.row]
        
    }
    
    
    
    
    //MARK: BUTTON ACTION METHODS
    
    func doneButton(){
        
        self.dismissViewControllerAnimated(true) { 
            print("done button pressed")
        }
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
