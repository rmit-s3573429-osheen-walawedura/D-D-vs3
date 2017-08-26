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
        if currentLocation!.imageName.contains("asset_"){
            img?.image = UIImage(named:currentLocation!.imageName)
        }
        else {
            let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
            let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
            if let dirPath          = paths.first
            {
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("asset-"+(currentLocation?.getName())!+".jpg")
                img?.image = UIImage(contentsOfFile: imageURL.path)
            
            }
        }
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
      
        }

        imagePicker.view!.removeFromSuperview()
        imagePicker.removeFromParentViewController()
    }
    
    //imagepicker cancel operation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {        imagePicker.view!.removeFromSuperview()
        imagePicker.removeFromParentViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        editButton.setTitle("Edit", for: [] )
        isEdit = false
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
            
            
            //saving chosen image to directory
            saveImageToDirectory()
            currentLocation?.changeInformation(name: lblName.text!, desc: lblDescription.text!, img: ("asset-"+lblName.text!+".jpg"))
    
            isEdit = false
        }
    }
    
    //function to save chosen image
    func saveImageToDirectory() {
        let imageData = UIImageJPEGRepresentation((img?.image!)!,1.0)
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let imgURL = docDir.appendingPathComponent("asset-"+lblName.text!+".jpg")
        try! imageData?.write(to: imgURL)
        
        print(imgURL)
        
        img?.image = UIImage(contentsOfFile: imgURL.path)!
     
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
        
        if currentLocation!.imageName.contains("asset_"){
            img?.image = UIImage(named:currentLocation!.imageName)
        }
        else{
            //loading edited image
            let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
            let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
            if let dirPath          = paths.first
            {
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("asset-"+lblName.text!+".jpg")
                self.img?.image   = UIImage(contentsOfFile: imageURL.path)
                
            }

        }
        
        setAllFieldsToNonInteractable()
    }
}
