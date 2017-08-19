//
//  ViewController.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//


import UIKit

class GeneralLocationViewController: UIViewController {
    // label for the Name of the location
    @IBOutlet weak var lblName: UITextField!
    
    @IBOutlet weak var lblDescription: UITextView!
    
    // label for the Model
    var model = GeneralLocationList.sharedInstance
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = model.getName()
        lblDescription.text = model.getDesc()
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

