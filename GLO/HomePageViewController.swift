//
//  HomePageViewController.swift
//  GLO
//
//  Created by Stephen Looney on 7/9/16.
//  Copyright © 2016 SpaceBoat Development LLC. All rights reserved.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var currentOuting: UIButton!
    
    @IBOutlet var posseTableController: PosseTableViewController!
    
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("In init for home page controller")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load homebase")
    }
    
    
    
    //MARK: IBACTIONS
    @IBAction func createOutingButton(sender: AnyObject) {
        
        print("create outing button pressed")
        
        
    }
    
    
    @IBAction func currentOutingButton(sender: AnyObject) {
        
        print("current outing button pressed")
        
    }
    
    @IBAction func createPosseButton(sender: AnyObject) {
        
        print("create possee button pressed")
        
    }
    

}