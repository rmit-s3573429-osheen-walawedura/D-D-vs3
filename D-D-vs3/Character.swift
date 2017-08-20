//
//  Character.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 20/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation

class Character {
    
    var characterName: String
    var characterSpecies: String
    var characterLocation: SpecificLocation
    var characterDescription: String
    var characterRolePlayNotes: String
    
    init(name: String, species: String, location: SpecificLocation, desc: String, notes: String) {
        characterName = name
        characterSpecies = species
        characterLocation = location
        characterDescription = desc
        characterRolePlayNotes = notes
    }
}
