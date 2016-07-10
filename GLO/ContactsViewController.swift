//
//  ContactsViewController.swift
//  GLO
//
//  Created by Toph on 7/9/16.
//  Copyright © 2016 SpaceBoat Development LLC. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

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
