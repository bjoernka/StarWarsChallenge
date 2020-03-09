//
//  DetailTabBarController.swift
//  StarWarsChallenge
//
//  Created by Björn Kaczmarek on 9/3/20.
//  Copyright © 2020 Björn Kaczmarek. All rights reserved.
//

import UIKit

class DetailTabController: UITabBarController {
    
    var film: Film? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Detail infos about film
        let detailVC = DetailViewController()
        let detailVCItem = UITabBarItem(title: "Infos", image: UIImage(named: "DetailSymbol"), selectedImage: UIImage(named: "DetailSymbol"))
        detailVC.tabBarItem = detailVCItem
        detailVC.film = film
        
        // Characters included in film
        let charactersVC = CharactersViewController()
        let charactersVCItem = UITabBarItem(title: "Characters", image: UIImage(named: "CharactersSymbol"), selectedImage: UIImage(named: "CharactersSymbol"))
        charactersVC.tabBarItem = charactersVCItem
        charactersVC.title = "Characters"
        charactersVC.film = film
        
        viewControllers = [detailVC, charactersVC]
        
    }
}
