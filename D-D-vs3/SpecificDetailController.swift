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
    
    var location: SpecificLocation?
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblName.text = location!.getName()
        lblType.text = location!.getType()
        lblAddress.text = location!.getAddress()
        lblOwner.setTitle(location!.getOwner(), for: [])
        txtDescription.text = location!.getDesc()
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
