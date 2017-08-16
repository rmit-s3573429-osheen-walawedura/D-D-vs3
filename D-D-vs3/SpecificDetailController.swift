//
//  SpecificDetail.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 16/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import UIKit

class SpecificDetailController: UIViewController {
    // labels
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblOwner: UIButton!
    @IBOutlet weak var txtDescription: UITextView!
    
    // label for the Model
    var model = SpecificLocationDetail()
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = model.getName()
        lblType.text = model.getType()
        lblAddress.text = model.getAddress()
        lblOwner.setTitle(model.getOwner(), for: [])
        txtDescription.text = model.getDesc()
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
