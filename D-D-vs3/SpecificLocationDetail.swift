//
//  SpecificLocaionDetails.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 16/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation

class SpecificLocationDetail {
    
    var locations = [SpecificLocation(name:"Stonehill Inn",type:"Inn", address:"Somewhere in Phandalin", owner:"Toblen Stonehill", desc:"Toblen came from the east of the Triboar, seeking the opportunity in prospecting like many others. He soon found that he knew more about running an inn than mining, and so he established the inn.")]
    
    init()
    {
        print ("Made")
        print(locations[0])
        print(locations[0].getName())
    }
    
    func getName() -> String
    {
        return locations[0].getName()
    }
    
    func getType() -> String{
        return locations[0].getType()
    }
    
    func getAddress() -> String{
        return locations[0].getAddress()
    }
    
    func getOwner() -> String{
        return locations[0].getOwner()
    }
    
    func getDesc() -> String {
        return locations[0].getDesc()
    }
    
    
}
