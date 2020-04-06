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
    
    var pokemonData = PokemonData() // Declare and initialize a property named pokemonData of type PokemonData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
 
        pokemonData.getData { //Call .getData on pokemonData and look at the returned, printed to the console. <아래 적힌 url이 잘 뜨는지 확인해라!>
            DispatchQueue.main.async {
            self.tableView.reloadData() // before using pokemonData to display Pokemon!(array말고 여러가지를 한번에 보여주기 전에, 아래 extension에서 pokemonData.pokemonarray 바꾸기 전에, get Data 적고 위에 PokemonData = Pokemon () 적어주기!)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // showing name for each pokemon, when it's name is clicked!
        if segue.identifier == "ShowSegue" {
        let destination = segue.destination as! DetailViewController
        let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.pokemon = pokemonData.pokeArray[selectedIndexPath.row]
        }
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource { // putting tableview calls into extension
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonData.pokeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //remember arrays + indePaths are zero-indexed, so you need indexPath.row + 1 to start counting at 1 instead of 0 .
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(pokemonData.pokeArray[indexPath.row].name)" // indexPath.row = 숫자! // name = for name to appear!
        return cell
    }
    
    
}
