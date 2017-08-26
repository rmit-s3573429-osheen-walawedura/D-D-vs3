//
//  ViewController.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//


import UIKit

class GeneralLocationViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // label for the Name of the location
    @IBOutlet weak var lblName: UITextField!
    
    @IBOutlet weak var lblDescription: UITextView!
    
    @IBOutlet weak var img: UIImageView?
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var currentLocation: GeneralLocation?
    
    var isEdit = false
    
    let imagePicker=UIImagePickerController()
    
    var tapGesture=UITapGestureRecognizer()
    
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
        
        //setting up tap gesture control
//        img?.isUserInteractionEnabled=true
//        tapGesture=UITapGestureRecognizer(target: self, action: #selector(GeneralLocationViewController.changeImage))
//        self.img?.addGestureRecognizer(tapGesture)
//        imagePicker.delegate = self
    }
    
    //function to invoke image change with tap
//    func changeImage() {
//        imageTapped(tapGesture)
//    }
    
    //setting the actions for the UIImagePickerController
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        imagePicker.delegate = self
        imagePicker.allowsEditing=false
        imagePicker.sourceType = .photoLibrary
        if isEdit == true{
            present(imagePicker, animated: true, completion: nil)
              print("image tapped for editing")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage{
            img?.contentMode = .scaleAspectFit
            img?.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    //imagepicker cancel operation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        editButton.setTitle("Edit", for: [] )
        isEdit = false
        print ("is editing")
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
