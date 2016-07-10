//
//  CreateOutingViewController.swift
//  GLO
//
//  Created by Stephen Looney on 7/10/16.
//  Copyright © 2016 SpaceBoat Development LLC. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class CreateOutingViewController:UIViewController {
    
    
    @IBOutlet var addMemberButton: UIButton!
    @IBOutlet var memberScrollView: UIScrollView!
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var mapImageView: UIImageView!
    @IBOutlet var curfewTimePicker: UIDatePicker!
    @IBOutlet var createOutingButton: UIButton!
    
    
    
    override func viewDidLoad() {
    
        addMemberButton.layer.cornerRadius = 15.0
        createOutingButton.layer.cornerRadius = 8.0
        mapImageView.layer.cornerRadius = 10.0
        
    }
    
    func viewWillAppear() {
        
    }
    
}