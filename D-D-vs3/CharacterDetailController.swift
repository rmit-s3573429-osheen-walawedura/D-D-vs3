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
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblSpecificLocation: UILabel!
    @IBOutlet weak var lblNotes: UITextView!
    @IBOutlet weak var txtDescription: UITextView!
    
    var currentCharacter: Character?
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = currentCharacter?.characterName
        lblSpecies.text = currentCharacter?.characterSpecies
        lblSpecificLocation.text = currentCharacter?.characterLocation.getName()
        lblNotes.text = currentCharacter?.characterRolePlayNotes
        txtDescription.text = currentCharacter?.characterDescription
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
        self.lblSpecies.text = character.characterSpecies
        self.lblNotes.text = character.characterRolePlayNotes
        self.lblSpecificLocation.text = character.characterLocation.getName()
}
}
