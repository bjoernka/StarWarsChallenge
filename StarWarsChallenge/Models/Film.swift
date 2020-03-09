//
//  Film.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import Foundation

// represents a film-object
struct Film {
    
    var title: String = ""
    var episode_id: Int = 0
    var opening_crawl: String = ""
    var director: String = ""
    var producer: String = ""
    var release_date: Date = Date()
    var characters: [String] = []
    var planets: [String] = []
    var starships: [String] = []
    var vehicles: [String] = []
    var species: [String] = []
    var created: String = ""
    var edited: String = ""
    var url: String = ""
    
    init(title: String, episode_id: Int, opening_crawl: String, director: String, producer: String, release_date: String, characters: [String], planets: [String], starships: [String], vehicles: [String], species: [String], created: String, edited: String, url: String) {
        self.title = title
        self.episode_id = episode_id
        self.opening_crawl = opening_crawl
        self.director = director
        self.producer = producer
        self.characters = characters
        self.planets = planets
        self.starships = starships
        self.vehicles = vehicles
        self.species = species
        self.created = created
        self.edited = edited
        self.url = url
        
        // turn Date-String into Date-Value
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: release_date) {
            self.release_date = date
        }
        
    }
}
