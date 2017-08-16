//
//  GeneralLocationDetail.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//

import Foundation

class GeneralLocationDetail {
    
    var locations = [GeneralLocation(name:"StormCoast",desc:"A windy stretch of coast"), GeneralLocation(name:"Phandalin", desc:"A mining town")]
    
    init()
    {
    }
    
    func getName()->String
    {
        return locations[0].getName()
    }
    
    func getDesc() -> String {
        return locations[0].getDesc()
    }
    
    
}

