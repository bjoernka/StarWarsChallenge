//
//  CharactersViewController.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import UIKit

class CharactersViewController: UITableViewController {

    var allCharacters: [Character] = []
    var film: FilmObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // remove unnecessary rows
        self.tableView.tableFooterView = UIView()
        
        getCharacters()
    }
    
    func getCharacters() {
        
        // download all characters of film-object
        if film != nil {
            for url in film!.characters {
                downloadCharacters(url: url)
            }
        }
    }
    
    func downloadCharacters(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if let dictionary = json as? [String: Any] {
                        if let name = dictionary["name"] as? String {
                            // get character name
                            let character = Character(name: name)
                            self.allCharacters.append(character)
                        }
                    }
                    DispatchQueue.main.async { self.tableView.reloadData() }
                } catch {
                    print("The error is:")
                    print(error)
                }
            }
        }.resume()
        return
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if allCharacters.count > 0 {
            return allCharacters.count
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if allCharacters.count > 0 {
            cell.textLabel?.text = allCharacters[indexPath.row].name
        } else {
            cell.textLabel?.text = "Loading Data..."
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
