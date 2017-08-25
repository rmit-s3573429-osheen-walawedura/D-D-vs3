//
//  File.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 20/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import UIKit

class CharacterDetailController: UIViewController {
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
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setAllFieldValues()
        setAllFieldsToFalse()
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
            currentCharacter?.changeCharacterInfo(name: lblName.text!, species: lblSpecies.titleLabel!.text!, desc: txtDescription.text, notes: lblNotes.text, location: lblSpecificLocation.text!)
            setAllFieldsToFalse()
            isEdit = false
        }
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
        img.image = UIImage(named: (currentCharacter?.imageName)!)
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
