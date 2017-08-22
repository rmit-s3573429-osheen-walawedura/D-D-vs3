//
//  SpeciesPopUpController.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 21/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation
import UIKit

class SpeciesPopUpController: UIViewController {
    
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblName: UILabel!
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblName.text = "Human"
        txtDescription.text = "The most populous species."
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss (_sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
