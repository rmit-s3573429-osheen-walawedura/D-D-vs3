//
//  GeneralLocationDetail.swift
//  D-D-vs3
//
//  Created by Nicole Renner on 16/8/17.
//  Copyright © 2017 Nicole Renner. All rights reserved.
//

import Foundation

class GeneralLocationDetail {
    
    var locations = [GeneralLocation(name:"StormCoast",desc:"A windy stretch of coast Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."), GeneralLocation(name:"Phandalin", desc:"A mining town")]
    
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

