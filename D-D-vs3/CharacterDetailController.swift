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
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = currentCharacter?.characterName
        lblSpecies.setTitle(currentCharacter?.characterSpecies, for: [])
        lblSpecificLocation.text = currentCharacter?.characterLocation.getName()
        lblNotes.text = currentCharacter?.characterRolePlayNotes
        txtDescription.text = currentCharacter?.characterDescription
        img.image = UIImage(named: (currentCharacter?.imageName)!)
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CharacterDetailController: RefreshCharacter {
    func refresh (character: Character) {
        self.lblName.text = character.characterName
        self.txtDescription.text = character.characterDescription
        self.lblSpecies.setTitle(character.characterSpecies, for: [])
        self.lblNotes.text = character.characterRolePlayNotes
        self.lblSpecificLocation.text = character.characterLocation.getName()
        self.img.image = UIImage(named: (character.imageName))
}
}
