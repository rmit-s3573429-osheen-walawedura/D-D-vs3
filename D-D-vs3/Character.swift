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
    var characterLocation: String
    var characterDescription: String
    var characterRolePlayNotes: String
    var imageName: String
    
    init(name: String, species: String, location: String, desc: String, notes: String, image: String) {
        characterName = name
        characterSpecies = species
        characterLocation = location
        characterDescription = desc
        characterRolePlayNotes = notes
        imageName = image
<<<<<<< HEAD
<<<<<<< HEAD
        characterLocation = location
    }
    
    func getName() -> String {
        return characterName
    }
    
    func getDesc() -> String {
        return characterDescription
    }
    
    func getSpecies() -> String {
        return characterSpecies
    }
    
    func getNotes() -> String {
        return characterRolePlayNotes
    }
    
    func getImage() -> String {
        return imageName
    }
    
    func getLocation() -> String {
        return characterLocation
    }
    
    func changeCharacterInfo(name: String, species: String, desc: String, notes: String, location: String, img: String) {
        characterName = name
        characterSpecies = species
        characterDescription = desc
        characterRolePlayNotes = notes
        characterLocation = location
        imageName = img

    }
    
    static func ==(char1: Character, char2: Character) -> Bool {
        return ObjectIdentifier(char1) == ObjectIdentifier(char2)
=======
        location.assignOwner(character: self)
>>>>>>> parent of 2d26036... ran UI testing, and recorded test steps
=======
        location.assignOwner(character: self)
>>>>>>> parent of 2d26036... ran UI testing, and recorded test steps
    }
}
