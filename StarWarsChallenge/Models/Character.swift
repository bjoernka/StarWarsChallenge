//
//  Character.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import Foundation

// represents a Character in a film
struct Character {
    
    // only "name" is necessary for the tableView - struct can be extended with other values if necessary
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
    
}
