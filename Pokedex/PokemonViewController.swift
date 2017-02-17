//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Levi Walsh on 2/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokemonForFavs: Pokemon!
    
    
    override func awakeFromNib() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.red
        
        
        
        //let number: Int = 13
        let name: String = "Pikachu"
        
        // pokemon will be found based on if a name or number are passed in
        let pokemon: Pokemon = SearchPokemon.findPokemon(name: name)!
        self.pokemonForFavs = pokemon
        setUI(pokemon: pokemon)
        
    }
    
    
    
    func setUI(pokemon: Pokemon) {
        
        
        
        //Creates picture and fills it to be a square on the screen
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.width)
        imageView.image = pokemon.getImage()
        view.addSubview(imageView)
        

        let specStartingHeight: CGFloat = imageView.frame.height
        let specHeight: CGFloat = view.frame.height - specStartingHeight
        
        // Attack
        let attackView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight, width: view.frame.width, height: specHeight * 1/10))
        attackView.font = UIFont(name: "Roboto-Black", size: 20.0)
        attackView.font = UIFont.systemFont(ofSize: 20)
        attackView.backgroundColor = UIColor.red
        attackView.text = "Attack: " + String(pokemon.attack)
        attackView.textAlignment = NSTextAlignment.left;
        view.addSubview(attackView)
        
        // Defense
        let defenseView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 1/10, width: view.frame.width, height: specHeight * 1/10))
        defenseView.font = UIFont(name: "Roboto-Black", size : 20.0)
        defenseView.font = UIFont.systemFont(ofSize: 20)
        defenseView.backgroundColor = UIColor.white
        defenseView.text = "Defense: " + String(pokemon.defense)
        defenseView.textAlignment = NSTextAlignment.left;
        view.addSubview(defenseView)

        // Health
        let healthView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 2/10, width: view.frame.width, height: specHeight * 1/10))
        healthView.font = UIFont(name: "Roboto-Black", size: 20.0)
        healthView.font = UIFont.systemFont(ofSize: 20)
        healthView.backgroundColor = UIColor.red
        healthView.text = "hitpoints: " + String(pokemon.health)
        healthView.textAlignment = NSTextAlignment.left;
        view.addSubview(healthView)
        
        // Special Attack
        let specialAttackView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 3/10, width: view.frame.width, height: specHeight * 1/10))
        specialAttackView.font = UIFont(name: "Roboto-Black", size: 20.0)
        specialAttackView.font = UIFont.systemFont(ofSize: 20)
        specialAttackView.backgroundColor = UIColor.white
        specialAttackView.text = "Special Attack: " + String(pokemon.specialAttack)
        specialAttackView.textAlignment = NSTextAlignment.left;
        view.addSubview(specialAttackView)
        
        // Special Defense
        let specialDefenseView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 4/10, width: view.frame.width, height: specHeight * 1/10))
        specialDefenseView.font = UIFont(name: "Roboto-Black", size: 20.0)
        specialDefenseView.font = UIFont.systemFont(ofSize: 20)
        specialDefenseView.backgroundColor = UIColor.red
        specialDefenseView.text = "Special Defense: " + String(pokemon.specialDefense)
        specialDefenseView.textAlignment = NSTextAlignment.left;
        view.addSubview(specialDefenseView)
        
        // Species
        let speciesView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 5/10, width: view.frame.width, height: specHeight * 1/10))
        speciesView.font = UIFont(name: "Roboto-Black", size: 20.0)
        speciesView.font = UIFont.systemFont(ofSize: 20)
        speciesView.backgroundColor = UIColor.white
        speciesView.text = "Species: " + String(pokemon.species)
        speciesView.textAlignment = NSTextAlignment.left;
        view.addSubview(speciesView)
        
        // Speed
        let speedView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 6/10, width: view.frame.width, height: specHeight * 1/10))
        speedView.font = UIFont(name: "Roboto-Black", size: 20.0)
        speedView.font = UIFont.systemFont(ofSize: 20)
        speedView.backgroundColor = UIColor.red
        speedView.text = "Speed: " + String(pokemon.speed)
        speedView.textAlignment = NSTextAlignment.left;
        view.addSubview(speedView)
        
        // Total
        let totalView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 7/10, width: view.frame.width, height: specHeight * 1/10))
        totalView.font = UIFont(name: "Roboto-Black", size: 20.0)
        totalView.font = UIFont.systemFont(ofSize: 20)
        totalView.backgroundColor = UIColor.white
        totalView.text = "Total: " + String(pokemon.total)
        totalView.textAlignment = NSTextAlignment.left;
        view.addSubview(totalView)
        
        // Decompose the array types to a string
        var words: String = ""
        for type in pokemon.types {
            words += type + " "
        }
        // Types
        let typesView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 8/10, width: view.frame.width, height: specHeight * 1/10))
        typesView.font = UIFont(name: "Roboto-Black", size: 20.0)
        typesView.font = UIFont.systemFont(ofSize: 20)
        typesView.backgroundColor = UIColor.red
        typesView.text = "Type: " + words
        typesView.textAlignment = NSTextAlignment.left;
        view.addSubview(typesView)
        
        // Add to Favorites
        let favButton: UIButton = UIButton.init(frame: CGRect(x: 0, y: specStartingHeight + specHeight * 9/10, width: view.frame.width / 2, height: specHeight * 1/10))

        favButton.backgroundColor = UIColor.cyan
        favButton.addTarget(self, action: #selector(favPokemon), for: .touchUpInside)
        favButton.setTitle("Add Favorite", for: .normal)
        favButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(favButton)
        
        // Web View
        let webButton: UIButton = UIButton(frame: CGRect(x: view.frame.width / 2, y: specStartingHeight + specHeight * 9/10, width: view.frame.width, height: specHeight * 1/10))
    }
    
    func favPokemon() {
        UserData.addToFavorites(name: pokemonForFavs.name)
    }
    
    // Load all data for Pokemon page
    func load(number: Int) {
        
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
