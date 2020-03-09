//
//  ViewController.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import UIKit

class StartViewController: UITableViewController {
    
    var allFilms: [Film] = []
    let filmURL = "https://swapi.co/api/films/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Star Wars"
        
        // remove titles from back button
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        // remove unnecessary rows
        self.tableView.tableFooterView = UIView()
        
        downloadFilms()
    }
    
    func downloadFilms() {
        
        //download films from swapi.co
        
        allFilms = []
        
        guard let url = URL(string: filmURL) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if let dictionary = json as? [String: Any] {
                        // Get all films
                        if let results = dictionary["results"] as? [[String: Any]] {
                            for result in results {
                                let film = Film(title: result["title"] as! String,
                                                episode_id: result["episode_id"] as! Int,
                                                opening_crawl: result["opening_crawl"] as! String,
                                                director: result["director"] as! String,
                                                producer: result["producer"] as! String,
                                                release_date: result["release_date"] as! String,
                                                characters: result["characters"] as! [String],
                                                planets: result["planets"] as! [String],
                                                starships: result["starships"] as! [String],
                                                vehicles: result["vehicles"] as! [String],
                                                species: result["species"] as! [String],
                                                created: result["created"] as! String,
                                                edited: result["edited"] as! String,
                                                url: result["url"] as! String)
                                self.allFilms.append(film)
                            }
                            // sort Array with newest release date at the beginning
                            self.allFilms = self.allFilms.sorted(by: {
                                $0.release_date.compare($1.release_date) == .orderedDescending
                            })
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
        if allFilms.count > 0 {
            return allFilms.count
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell")!
        
        if allFilms.count > 0 {
            cell.textLabel?.text = allFilms[indexPath.row].title
        } else {
            cell.textLabel?.text = "Loading Data..."
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // show TabBarVC with DetailInfos and Characters about chosen film
        let tabBarVC = DetailTabController()
        tabBarVC.film = allFilms[indexPath.row]
        tabBarVC.title = allFilms[indexPath.row].title
        self.navigationController?.pushViewController(tabBarVC, animated: true)
        
    }
    
}

