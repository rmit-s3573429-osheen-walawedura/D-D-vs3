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
    
    var specificlocations = [SpecificLocation(name:"Stonehill Inn",type:"Inn", address:"Somewhere in Phandalin", owner:"Toblen Stonehill", desc:"Toblen came from the east of the Triboar, seeking the opportunity in prospecting like many others. He soon found that he knew more about running an inn than mining, and so he established the inn."),SpecificLocation(name:"Stonehill Inn",type:"Inn", address:"Somewhere in Phandalin", owner:"Toblen Stonehill", desc:"Toblen came from the east of the Triboar, seeking the opportunity in prospecting like many others. He soon found that he knew more about running an inn than mining, and so he established the inn.")]
    
    init(name: String, desc: String) {
        locationName = name
        locationDesc = desc
    }
    
    func getName() -> String {
        return locationName
    }
    
    func getDesc() -> String {
        return locationDesc
    }
    
}
