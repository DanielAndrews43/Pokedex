//
//  SearchPokemon.swift
//  Pokedex
//
//  Created by Daniel Andrews on 2/16/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchPokemon: NSObject {
    
    static let pokemon: [Pokemon] = PokemonGenerator.getPokemonArray()
    
    static func findPokemon(name: String) -> Pokemon? {
        for poke in pokemon {
            if poke.name == name {
                return poke
            }
        }
        
        return nil
    }
    
    static func findPokemon(number: Int) -> Pokemon? {
        for poke in pokemon {
            if poke.number == number {
                return poke
            }
        }
        
        return nil
    }
    
    private static func compareTwoArrays (_ arr1: [String], _ arr2: [String]) -> Bool {
        if arr1.count != arr2.count {
            return false
        }
        
        for a in arr1 {
            var isIn = false
            for b in arr2 {
                if a == b {
                    isIn = true
                }
            }
            
            if isIn == false {
                return false
            }
        }
        
        return true
    }
    
    static func findPokemon(minAttack: Int, minDef: Int, minHP: Int, types: [String]) -> [Pokemon]? {
        var pokeRay: [Pokemon] = []
        
        for poke in pokemon {
            if poke.attack >= minAttack && poke.defense >= minDef &&
                poke.health >= minHP && compareTwoArrays(types, poke.types) {
                
                pokeRay.append(poke)
                
            }
        }
        
        return pokeRay
    }
    
    static func findRandomPokemon() -> [Pokemon] {
        var pokeRay: [Pokemon] = []
        
        while pokeRay.count < 20 {
            let index = arc4random_uniform(UInt32(pokemon.count)) + 1
            let poke = findPokemon(number: Int(index))
            
            var isIn: Bool = false
            for p in pokemon {
                if p.number == poke!.number {
                    isIn = true
                }
            }
            
            if !isIn {
                pokeRay.append(poke!)
            }
        }
        
        return pokeRay
    }
    
    private static func searchString(str: String) -> String {
        return str.replacingOccurrences(of: " ", with: "+")
    }
    
    static func searchOnWeb(name: String) -> URLRequest {
        let url = URL (string: "https://google.com/search?q=" + searchString(str: name))
        return URLRequest(url: url!);
    }
}
