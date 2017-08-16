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
