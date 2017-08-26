//
//  File.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 20/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import UIKit

class CharacterDetailController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // labels
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblSpecies: UIButton!
    @IBOutlet weak var lblSpecificLocation: UITextField!
    @IBOutlet weak var lblNotes: UITextView!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    var currentCharacter: Character?
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var isEdit = false
    
    var imgPath = NSURL()

    let imagePicker=UIImagePickerController()
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lblName.text = currentCharacter!.getName()
        txtDescription.text = currentCharacter!.getDesc()
        
        if currentCharacter!.imageName.contains("asset_"){
            img?.image = UIImage(named:currentCharacter!.imageName)
        }
        else {
            let paths               = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            
            if let dirPath          = paths.first
            {
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("asset-"+(currentCharacter?.getName())!+".jpg")
                img?.image = UIImage(contentsOfFile: imageURL.path)
                
            }
        }
        
        checkWhetherDeleteIsEnabled()
        setAllFieldsToNonInteractable()
        setAllFieldValues()
        setAllFieldsToFalse()
        
        isEdit = false
        
    }
    
      //setting the actions for the UIImagePickerController
    @IBAction func changeImage(_ sender: UITapGestureRecognizer) {
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
    
    // Respond to the user clicking a button by providing advice from the oracle
    @IBAction func edit(sender: UIButton)
    {
        if isEdit == false {
            editButton.setTitle("Confirm", for: [])
            lblName.isUserInteractionEnabled = true
            lblSpecies.isUserInteractionEnabled = true
            lblSpecificLocation.isUserInteractionEnabled = true
            lblNotes.isUserInteractionEnabled = true
            txtDescription.isUserInteractionEnabled = true
            txtDescription.isEditable = true
            lblNotes.isEditable = true
            isEdit = true
        }
        else {
            editButton.setTitle("Edit", for: [])
            
            //saving chosen image to directory
            saveImageToDirectory()
            currentCharacter?.changeCharacterInfo(name: lblName.text!, species: lblSpecies.titleLabel!.text!, desc: txtDescription.text, notes: lblNotes.text, location: lblSpecificLocation.text!, img: ("asset-"+lblName.text!+".jpg"))
            setAllFieldsToFalse()
            isEdit = false
        }
    }
    
    //function to save chosen image
    func saveImageToDirectory() {
        let imageData = UIImageJPEGRepresentation((img?.image!)!,1.0)
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let imgURL = docDir.appendingPathComponent("asset-"+lblName.text!+".jpg")
        try! imageData?.write(to: imgURL)
        
        img?.image = UIImage(contentsOfFile: imgURL.path)!
        
    }
    
    //sets all fields to non-changeable
    func setAllFieldsToNonInteractable() {
        lblName.isUserInteractionEnabled = false
        lblSpecies.isUserInteractionEnabled = false
        lblSpecificLocation.isUserInteractionEnabled = false
        lblNotes.isUserInteractionEnabled = false
        txtDescription.isUserInteractionEnabled = false
        txtDescription.isEditable = false
        lblNotes.isEditable = false
    }
    

    
    @IBAction func delete(sender: UIButton) {
        CharacterList.sharedInstance.characters.remove(object: currentCharacter!)
        currentCharacter = CharacterList.sharedInstance.characters[0]
        setAllFieldsToFalse()
        setAllFieldValues()
        checkWhetherDeleteIsEnabled()
    }
    
    func setAllFieldsToFalse() {
        lblName.isUserInteractionEnabled = false
        lblSpecificLocation.isUserInteractionEnabled = false
        lblNotes.isEditable = false
        txtDescription.isEditable = false
        lblSpecies.isEnabled = true
    }
    
    func setAllFieldValues() {
        lblName.text = currentCharacter?.characterName
        lblSpecies.setTitle(currentCharacter?.characterSpecies, for: [])
        lblSpecificLocation.text = currentCharacter?.characterLocation
        lblNotes.text = currentCharacter?.characterRolePlayNotes
        txtDescription.text = currentCharacter?.characterDescription
        
        if currentCharacter!.imageName.contains("asset_"){
            img?.image = UIImage(named:currentCharacter!.imageName)
        }
        else {
            let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            
            if let dirPath = paths.first
            {
                let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("asset-"+(currentCharacter?.getName())!+".jpg")
                img?.image = UIImage(contentsOfFile: imageURL.path)
                
            }
        }
        
    }
    
    func checkWhetherDeleteIsEnabled() {
        if CharacterList.sharedInstance.characters.count <= 1 {
            deleteButton.isHidden = true
        }
    }
}

extension CharacterDetailController: RefreshCharacter {
    func refresh (character: Character) {
        self.lblName.text = character.characterName
        self.txtDescription.text = character.characterDescription
        self.lblSpecies.setTitle(character.characterSpecies, for: [])
        self.lblNotes.text = character.characterRolePlayNotes
        self.lblSpecificLocation.text = character.characterLocation
        self.img.image = UIImage(named: (character.imageName))
}
}
