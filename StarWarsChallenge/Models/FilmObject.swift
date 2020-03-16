//
//  FilmObject.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 15/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import Foundation

struct FilmObject: Codable {

    var title: String
    var episode_id: Int
    var opening_crawl: String
    var director: String
    var producer: String
    var release_date: String 
    var characters: [String]
    var planets: [String]
    var starships: [String]
    var vehicles: [String]
    var species: [String]
    var created: String
    var edited: String
    var url: String
}
