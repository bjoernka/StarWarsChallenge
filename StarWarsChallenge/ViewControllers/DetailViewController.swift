//
//  DetailViewController.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var film: Film? = nil
    var criterias = ["Title:", "Director:", "Producer:", "Release date:", "Url:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // remove unnecessary rows
        self.tableView.tableFooterView = UIView()
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
    
        let detailCell = Bundle.main.loadNibNamed("DetailTableViewCell", owner: self, options: nil)?.first as! DetailTableViewCell
        
        if film != nil {
            switch indexPath.row {
            case 0:
                detailCell.criteriaLabel.text = criterias[indexPath.row]
                detailCell.valueLabel.text = film!.title
            case 1:
                detailCell.criteriaLabel.text = criterias[indexPath.row]
                detailCell.valueLabel.text = film!.director
            case 2:
                detailCell.criteriaLabel.text = criterias[indexPath.row]
                detailCell.valueLabel.text = film!.producer
            case 3:
                detailCell.criteriaLabel.text = criterias[indexPath.row]
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                detailCell.valueLabel.text = dateFormatter.string(from: film!.release_date)
            case 4:
                detailCell.criteriaLabel.text = criterias[indexPath.row]
                detailCell.valueLabel.text = film!.url
            default:
                detailCell.criteriaLabel.text = "criteria"
                detailCell.valueLabel.text = "value"
            }
        } else {
            detailCell.criteriaLabel.text = "No values"
        }

        return detailCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
