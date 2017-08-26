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
    
    var isEdit = Bool()
    
    let imagePicker=UIImagePickerController()
    
    var imgPath = NSURL()
    
    var imgName = String()
    
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblName.text = currentLocation!.getName()
        lblDescription.text = currentLocation!.getDesc()
        img?.image = UIImage(named:currentLocation!.imageName)
        checkWhetherDeleteIsEnabled()
        setAllFieldsToNonInteractable()
        isEdit = false

    }
    
    //setting the actions for the UIImagePickerController
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        imagePicker.delegate = self
        imagePicker.allowsEditing=false
        imagePicker.sourceType = .photoLibrary
        if isEdit == true{
//            present(imagePicker, animated: true, completion: nil)
            self.addChildViewController(imagePicker)
            imagePicker.didMove(toParentViewController: self)
            self.view!.addSubview(imagePicker.view!)
        }
    }
    
    //assigning the changed image to thw imageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage{
            img?.contentMode = .scaleAspectFit
            img?.image = pickedImage
            
            //getting image path
            imgPath = (info[UIImagePickerControllerReferenceURL] as! NSURL)
            imgName = imgPath.lastPathComponent!
            print(imgName)
            print(imgPath)
        }
        
//        dismiss(animated: true, completion: nil)
        imagePicker.view!.removeFromSuperview()
        imagePicker.removeFromParentViewController()
    }
    
    //imagepicker cancel operation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
        imagePicker.view!.removeFromSuperview()
        imagePicker.removeFromParentViewController()
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
            
            //capturing image URL
            currentLocation?.changeInformation(name: lblName.text!, desc: lblDescription.text!, img: imgName)
            
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
