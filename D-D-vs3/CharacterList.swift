//
//  CharacterList.swift
//  D-D-vs3
//
//  Created by Osheen Walawedura on 20/8/17.
//  Copyright © 2017 Osheen Walawedura. All rights reserved.
//

import Foundation

class CharacterList {
    
    private struct Static  {
        static var instance: CharacterList?
    }
    
    class var sharedInstance: CharacterList {
        if !(Static.instance != nil) {
            Static.instance = CharacterList()
        }
        return Static.instance!
    }
    
    var characters: [Character] = []
    
    init() {
        
    }
    
    func addCharacterToList(char: Character) {
        characters.append(char)
    }
}
