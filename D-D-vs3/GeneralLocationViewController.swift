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
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var currentLocation: GeneralLocation?
    
    var isEdit = false
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // textView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = currentLocation!.getName()
        lblDescription.text = currentLocation!.getDesc()
        img?.image = UIImage(named:currentLocation!.imageName)
        checkWhetherDeleteIsEnabled()
        setAllFieldsToNonInteractable()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setAllFieldsToNonInteractable()
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAllFieldsToNonInteractable() {
        lblName.isUserInteractionEnabled = false
        lblDescription.isEditable = false
    }
    
    // Respond to the user clicking the edit button
    @IBAction func edit(sender: UIButton)
    {
        if isEdit == false {
        editButton.setTitle("Confirm", for: [])
        lblName.isUserInteractionEnabled = true
        lblDescription.isEditable = true
        isEdit = true
        }
        else {
            editButton.setTitle("Edit", for: [])
            setAllFieldsToNonInteractable()
            currentLocation?.changeInformation(name: lblName.text!, desc: lblDescription.text!)
            print ("Location info: " + (currentLocation?.getDesc())!)
            isEdit = false
        }
    }
    
    @IBAction func delete(sender: UIButton) {
        GeneralLocationList.sharedInstance.locations.remove(object: currentLocation!)
        currentLocation = GeneralLocationList.sharedInstance.locations[0]
        setAllFieldsToNonInteractable()
        lblName.text = currentLocation!.getName()
        lblDescription.text = currentLocation!.getDesc()
        img?.image = UIImage(named:currentLocation!.imageName)
        checkWhetherDeleteIsEnabled()

    }
    
    func checkWhetherDeleteIsEnabled() {
        if GeneralLocationList.sharedInstance.locations.count <= 1 {
            deleteButton.isHidden = true
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let maxCharacter: Int = 300
        return (textView.text?.utf16.count ?? 0) + text.utf16.count - range.length <= maxCharacter
    }
}

extension GeneralLocationViewController: Refresh {
    func refresh (location: GeneralLocation) {
        self.currentLocation = location
        self.lblName.text = location.locationName
        self.lblDescription.text = location.getDesc()
        self.img?.image = UIImage(named:location.imageName)
        setAllFieldsToNonInteractable()
    }
}
