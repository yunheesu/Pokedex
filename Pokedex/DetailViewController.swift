//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
        
    var pokemon: Pokemon! //Pokemon 이 string 이니깐!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if pokemon == nil {
            pokemon = Pokemon(name: "", url: "")
        }
        nameLabel.text = pokemon.name
        weightLabel.text = ""
        heightLabel.text = ""
        
    }
    
    

}
