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
    
    var locations: Array<GeneralLocation> = []

    private init()
    {
    }
    
    func addNewGeneralLocation(name: String, type: String, desc: String, image: String) {
        locations.append(GeneralLocation(name: name, type: type, desc: desc, image: image))
    }
    
    func getListOfGeneralLocations() -> [GeneralLocation] {
        return locations
    }
    
}

extension Array where Element: Equatable {
    
    mutating func remove(object: Element) {
        
        if let index = index(of: object) {
            
            remove(at: index)
        }
    }
}

