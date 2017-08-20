//
//  GeneralLocations.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//

import Foundation

class GeneralLocation {
    
    var locationName: String
    var locationDesc: String
    
    var specificlocations: [SpecificLocation] = []
    
    init(name: String, desc: String) {
        locationName = name
        locationDesc = desc
        addNewLocation(name:"Stonehill Inn", type:"Inn", address:"Somewhere in Phandalin", desc:"Toblen came from the east of the Triboar, seeking the opportunity in prospecting like many others. He soon found that he knew more about running an inn than mining, and so he established the inn.")
        addNewLocation(name:"The Sleeping Giant", type:"Tavern", address:"Somewhere in Phandalin", desc:"An old crumbling stone building with boarded up windows.")
        var character1 = Character(name: "Aram Silverheart", species: "Human", location: specificlocations[0], desc: "An old human, bent and bowed. He carries a walking stick in his left hand, but something suggests he might use it for more than walking", notes: "Gruff voice. Likes carpentry.")
        CharacterList.sharedInstance.addCharacterToList(char: character1)
        specificlocations[0].assignOwner(character: character1)
        var character2 = Character(name: "Gundren Rockseeker", species: "Dwarf", location: specificlocations[1], desc: "An dwarf in the prime of his life.", notes: "Gruff voice. Likes carpentry.")
        CharacterList.sharedInstance.addCharacterToList(char: character2)
        specificlocations[1].assignOwner(character: character2)
    }
    
    func addNewLocation(name:String,type:String, address:String, desc:String) {
        specificlocations.append(SpecificLocation(name: name, type: type, address: address, desc: desc))
    }
    
    func getName() -> String {
        return locationName
    }
    
    func getDesc() -> String {
        return locationDesc
    }
    
}
