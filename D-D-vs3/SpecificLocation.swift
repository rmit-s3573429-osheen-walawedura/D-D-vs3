//
//  SpecificLocation.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 16/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation

class SpecificLocation {
    
    var locationName: String
    var locationType: String
    var locationAddress: String
    var locationOwner:Character?
    var locationDesc: String
    
    init(name: String, type: String, address: String, desc: String) {
        locationName = name
        locationType = type
        locationAddress = address
        locationDesc = desc
    }
    
    func assignOwner(character: Character) {
        locationOwner = character
    }
    
    func getName() -> String {
        return locationName
    }
    
    func getType() -> String {
        return locationType
    }
    
    func getAddress() -> String{
        return locationAddress
    }
    
    func getOwner() -> Character{
        return locationOwner!
    }
    
    func getDesc() -> String {
        return locationDesc
    }
    
}
