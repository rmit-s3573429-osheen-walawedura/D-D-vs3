//
//  GeneralLocationDetail.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//

import Foundation

class GeneralLocationList {
    
    private struct Static  {
    static var instance: GeneralLocationList?
    }
    
    class var sharedInstance: GeneralLocationList {
        if !(Static.instance != nil) {
            Static.instance = GeneralLocationList()
        }
        return Static.instance!
    }
    
    var locations: [GeneralLocation] = []
    
    private init()
    {
        
    }
    
    func addNewGeneralLocation(name: String, desc: String, image: String) {
        locations.append(GeneralLocation(name: name, desc: desc, image: image))
    }
    
    func getListOfGeneralLocations() -> [GeneralLocation] {
        return locations
    }
    
}

