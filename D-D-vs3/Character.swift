//
//  Character.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 20/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation

class Character : Equatable {
    
    var characterName: String
    var characterSpecies: String
    var characterLocation: SpecificLocation
    var characterDescription: String
    var characterRolePlayNotes: String
    var imageName: String
    
    init(name: String, species: String, location: SpecificLocation, desc: String, notes: String, image: String) {
        characterName = name
        characterSpecies = species
        characterLocation = location
        characterDescription = desc
        characterRolePlayNotes = notes
        imageName = image
        characterLocation.assignOwner(character: self)
    }
    
    func changeCharacterInfo(name: String, species: String, desc: String, notes: String, image: String) {
        characterName = name
        characterSpecies = species
        characterDescription = desc
        characterRolePlayNotes = notes
        imageName = image
        characterLocation.assignOwner(character: self)
    }
    
    static func ==(char1: Character, char2: Character) -> Bool {
        return ObjectIdentifier(char1) == ObjectIdentifier(char2)
    }
}
