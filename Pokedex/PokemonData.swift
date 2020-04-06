//
//  File.swift
//  Pokedex
//
//  Created by Heesu Yun on 4/6/20.
//  Copyright © 2020 Heesu Yun. All rights reserved.
//

import Foundation

class PokemonData { // creating a class named PokemonData
    private struct Returned: Codable {
        var count: Int
        var next: String
        var results: [Pokemon] // getting an array of Pokemon, named results.
    }
    
    var url = "https://pokeapi.co/api/v2/pokemon/"
    var count = 0
    var pokeArray: [Pokemon] = [] // a property named pokeArray that is an empty array of Pokemon. --> initialized empty array!
    
    func getData(completed: @escaping () -> ()) { //escaping closure to get data until you've gotten the data
        let urlString = url // 바꿀껀, url 이랑 do 아래 있는애들
        print("🕸 We are accessing the url \(urlString)")
        //Create a URL
        guard let url = URL(string: urlString) else{
            print("😡 ERROR: could not create URL from \(urlString)")
            completed()
            return
        }
        //Create Session
        let session = URLSession.shared
        
        //Get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("😡 ERROR: \(error.localizedDescription)")
            }
            
            do {
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                print("😎 Here is what you returned: \(returned)")
                self.count = returned.count // Assigning the count and next properties of returned to the count and url properties of PokemonData
                self.url = returned.next
                for index in 0..<returned.results.count {
                    self.pokeArray.append(returned.results[index]) //individual pokemon element from the array in "results"
                    print("name: \(self.pokeArray[index].name), url: \(self.pokeArray[index].url)")
                }
                
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
    
}
