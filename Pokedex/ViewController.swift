//
//  ViewController.swift
//  Pokedex
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! // tableView연결!
    // remember! dataSource + delegate!
    
    var pokemonData = PokemonData () // Declare and initialize a property named pokemonData of type PokemonData
    
    var pokeArray = ["Bulbasaur", "Pikachu", "Snorlax", "Wigglytuff", "Charmander"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
        pokemonData.getData { //Call .getData on pokemonData and look at the returned, printed to the console. <아래 적힌 url이 잘 뜨는지 확인해라!>
            //nothing here, yet. Look at the console!
        }
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource { // putting tableview calls into extension
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //remember arrays + indePaths are zero-indexed, so you need indexPath.row + 1 to start counting at 1 instead of 0 .
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(pokeArray[indexPath.row])" // indexPath.row = 숫자!
        return cell
    }
    
    
}
