//
//  GeneralLocations.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//

import Foundation

class GeneralLocation: Equatable {
    
    var locationName: String
    var locationType: String
    var locationDesc: String
    var imageName: String
    
    var specificlocations: [SpecificLocation] = []
    
    init(name: String, type: String, desc: String, image: String) {
        locationName = name
        locationType = type
        locationDesc = desc
        imageName = image
    }
    
    func addNewLocation(name:String,type:String, address:String, desc:String, image: String) {
        specificlocations.append(SpecificLocation(name: name, type: type, address: address, desc: desc, image: image))
    }
    
    func getName() -> String {
        return locationName
    }
    
    func getDesc() -> String {
        return locationDesc
    }
    
    func changeInformation(name: String, desc: String, img: String) {
        locationDesc = desc
        locationName = name
        imageName = img
    }
    
    static func ==(location: GeneralLocation, place: GeneralLocation) -> Bool {
        return ObjectIdentifier(location) == ObjectIdentifier(place)
    }
    
}
