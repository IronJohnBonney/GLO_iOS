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
    
    
    @IBOutlet var outingNameTextField: UITextField!
    @IBOutlet var addMemberButton: UIButton!
    @IBOutlet var memberScrollView: UIScrollView!
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var mapImageView: UIImageView!
    @IBOutlet var curfewTimePicker: UIDatePicker!
    @IBOutlet var createOutingButton: UIButton!
    
    var dismissBlock:(() -> Void)! = {}
    
    var postData:NSData? = NSData.init()
    
    override func viewDidLoad() {
    
        addMemberButton.layer.cornerRadius = 15.0
        createOutingButton.layer.cornerRadius = 8.0
        mapImageView.layer.cornerRadius = 10.0
        
    }
    
    func viewWillAppear() {
        print("CreateOutingView will appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        print("bye felicia")
        // TODO: Handle closing out this view
        
    }
    
    @IBAction func createOutingButtonPressed(sender: AnyObject) {
        
        if ((destinationTextField.text == "") || (outingNameTextField.text == "")) {
            
            let a = UIAlertController.init(title: "Add a name and destination please!" , message: "What's a party without a venue, and what's an outing without a name? Go on, fill out the deets please.", preferredStyle: .Alert)
            
            //a.view.backgroundColor = UIColor.blackColor()
            //a.view.tintColor = UIColor.blueColor()
            
            let okAction = UIAlertAction(title: "Got It", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                print("Pressed OK Block")
            }
            
            a.addAction(okAction)
            
            self.presentViewController(a, animated: true, completion: nil)
            
        } else {
            // TODO: This is where the API hit will get called to POST the data (destination for now)
            postOuting(outingNameTextField.text!, destination: destinationTextField.text!)
            self.dismissViewControllerAnimated(true, completion: dismissBlock)
        }
    }
    
    func postOuting(name:String, destination:String) {
        
            // TODO: Consider moving this request to CliqueDataStore so other classes can call it.
            //Set postData as nil just in case it had some other value
            postData = nil
        
            // TODO: Below can be replaced with cliqueObject.
        let vars = NSMutableDictionary.init(dictionary: ["name":name, "destination":destination])
        
            
            do {
                postData = try NSJSONSerialization.dataWithJSONObject(vars, options: NSJSONWritingOptions(rawValue:0))
            } catch {
                print("Error with NSJSONSerialization in CliqueDataStore.getOneClique!")
            }
            var postLength = ""
            if let postData = postData {
                postLength = String("%lu", postData.length)
            }
            
            // Next initialize the request
            let request = NSMutableURLRequest.init()
            request.URL = CFURLCreateWithString(nil, "https://pure-caverns-99011.herokuapp.com/createOuting", nil)
            request.HTTPMethod = "POST"
            request.setValue(postLength, forHTTPHeaderField: "Content-Length")
            request.HTTPBody = postData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let returnArray:NSMutableArray = []
            
            // Execute the request
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
                
                guard error == nil && data != nil else {
                    // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                
                let requestReply = NSString.init(data: data!, encoding: NSASCIIStringEncoding)
                print("postCreateOuting reply:", requestReply)
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSMutableDictionary
                    print("postCreateOuting JSON response ->", json)
                    
                    // TODO: May want to include a dismiss block to handle the data beyond this
                    //self.updateCliqueTrackArrayBlock() // updates CliqueSongID Array data
                    /*
                     dispatch_async(dispatch_get_main_queue(), {
                     self.tableView.reloadData()
                     self.viewDidLoad()
                     })
                     */
                } catch {
                    print("Something went wrong, better figure it out derp")
                    //self.searchReturnName.removeAllObjects()
                    //self.searchReturnID.removeAllObjects()
                    dispatch_async(dispatch_get_main_queue(), {
                        // self.tableView.reloadData()
                    })
                }
            }
            task.resume()
        }

    
    
}