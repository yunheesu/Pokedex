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
    }
    var url = "https://pokeapi.co/api/v2/pokemon/"
    var count = 0
    //It's a good idea to copy a working URL rather than risk typos
    
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
                
            } catch {
            print("😡 JSON ERROR: \(error.localizedDescription)")
        }
        completed()
    }
    task.resume()
}

}
