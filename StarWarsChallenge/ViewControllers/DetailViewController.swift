//
//  DetailViewController.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var film: FilmObject? = nil
    var criterias = ["Title:", "Director:", "Producer:", "Release date:", "Url:"]
    var values : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        values = [film!.title, film!.director, film!.producer, film!.release_date, film!.url]

        // remove unnecessary rows
        self.tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if film != nil {
            return criterias.count
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let detailCell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        if film != nil {
            detailCell.criteriaLabel.text = criterias[indexPath.row]
            detailCell.valueLabel.text = values[indexPath.row]
        } else {
            detailCell.criteriaLabel.text = "No values"
        }

        return detailCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
