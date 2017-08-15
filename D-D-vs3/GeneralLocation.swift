//
//  GeneralLocations.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 16/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation

class GeneralLocation {
    
    var locationName: String
    var locationDesc: String
    
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
