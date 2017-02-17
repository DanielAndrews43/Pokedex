//
//  UserData.swift
//  Pokedex
//
//  Created by Daniel Andrews on 2/16/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class UserData: NSObject {
    
    static let defaults = UserDefaults.standard
    
    struct defaultsKeys {
        static let favorites = "Favorites"
    }
    
    static func addToFavorites (name: String) {
        var faves: [String] = defaults.array(forKey: defaultsKeys.favorites) as! [String]
        faves.append(name)
        
        defaults.setValue(faves, forKey: defaultsKeys.favorites)
    }
    
    static func isFavorite(name: String) -> Bool {
        let faves: [String]? = defaults.array(forKey: defaultsKeys.favorites) as? [String]
        
        if (faves != nil){
            for fave in faves! {
                if fave == name {
                    return true
                }
            }
        }
        return false
    }
    
    static func removeFromFavorites(name: String) {
        var faves: [String] = defaults.array(forKey: defaultsKeys.favorites) as! [String]

        let index = faves.index(of: name)
        if (index != nil) && index! >= 0 {
            faves.remove(at: index!)
        }
    }
}
