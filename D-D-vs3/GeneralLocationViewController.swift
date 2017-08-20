//
//  ViewController.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//


import UIKit

class GeneralLocationViewController: UIViewController, UITextViewDelegate {
    // label for the Name of the location
    @IBOutlet weak var lblName: UITextField!
    
    @IBOutlet weak var lblDescription: UITextView!
    
    @IBOutlet weak var img: UIImageView?
    
    var currentLocation: GeneralLocation?
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
 //       textView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = currentLocation!.getName()
        lblDescription.text = currentLocation!.getDesc()
        img?.image = UIImage(named:currentLocation!.imageName)
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        // Set a property on the destination view controller
        let detailsVC = segue.destination as! SpecificLocationTableViewController
        
        detailsVC.model = currentLocation
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let maxCharacter: Int = 300
        return (textView.text?.utf16.count ?? 0) + text.utf16.count - range.length <= maxCharacter
    }
}

extension GeneralLocationViewController: Refresh {
    func refresh (location: GeneralLocation) {
        self.lblName.text = location.locationName
        self.lblDescription.text = location.getDesc()
        img?.image = UIImage(named:currentLocation!.imageName)
    }
}
