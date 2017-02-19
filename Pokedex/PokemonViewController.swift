//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Levi Walsh on 2/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokemon: Pokemon!
    let buttonHeight: CGFloat = 0.1
    
    
    override func awakeFromNib() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.red
        
        
        
        //let number: Int = 13
        let name: String = "Pikachu"
        
        // pokemon will be found based on if a name or number are passed in
        let pokemon: Pokemon = SearchPokemon.findPokemon(name: name)!
        self.pokemon = pokemon
        setUI(pokemon: pokemon)
        
    }
    
    
    
    func setUI(pokemon: Pokemon) {
        
        
        
        //Creates picture and fills it to be a square on the screen
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.width)
        imageView.image = pokemon.getImage()
        view.addSubview(imageView)
        
        var types: String = ""
        for type in pokemon.types {
            types += type + " "
        }
        
        let descriptions: [String] = ["Attack", "Defense", "Health", "Special Attack", "Special Defense", "Species", "Speed", "Total", "Types"]
        let vals: [String] = [String(pokemon.attack), String(pokemon.defense), String(pokemon.health), String(pokemon.specialAttack), String(pokemon.specialDefense), String(pokemon.species), String(pokemon.speed), String(pokemon.total), types]
        
        var red = true
        var count = 0
        let specHeight = (view.frame.height - imageView.frame.height - buttonHeight * view.frame.height) / CGFloat(vals.count)
        
        for _ in 0..<descriptions.count {
            var color = UIColor.white
            if red {
                color = UIColor.red
            }
            
            let yCoord = imageView.frame.maxY + CGFloat(count) * specHeight
            
            let newView: UIView = InfoView(frame: CGRect(x: 0, y: yCoord, width: view.frame.width, height: specHeight), descr: descriptions[count], value: vals[count], color: color)
            view.addSubview(newView)
            count += 1
            red = !red
        }
        
        // Add to Favorites
        let favButton: UIButton = UIButton.init(frame: CGRect(x: 0, y: view.frame.height - buttonHeight * view.frame.height, width: view.frame.width / 2, height: view.frame.height * buttonHeight))

        favButton.backgroundColor = UIColor.cyan
        favButton.addTarget(self, action: #selector(favPokemon), for: .touchUpInside)
        favButton.setTitle("Add Favorite", for: .normal)
        favButton.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(favButton)
        
        // Web View
        let webButton: UIButton = UIButton(frame: CGRect(x: favButton.frame.maxX, y: favButton.frame.minY, width: view.frame.width / 2, height: view.frame.height * buttonHeight))
        webButton.backgroundColor = UIColor.cyan
        favButton.addTarget(self, action: #selector(webSearch), for: .touchUpInside)
        view.addSubview(webButton)
    }
    
    func favPokemon() {
        UserData.addToFavorites(name: self.pokemon.name)
    }
    
    func webSearch() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MagnifiedViewController
        vc.amount = totalAmountField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class InfoView: UIView {
    var descr: String!
    var value: String!
    var color: UIColor!
    
    init(frame: CGRect, descr: String, value: String, color: UIColor) {
        super.init(frame: frame)
        
        self.descr = descr
        self.value = value
        self.color = color
        
        setLayout(frame: frame)
    }
    
    func setLayout(frame: CGRect) {
        let descrView: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width / 2, height: frame.height))
        descrView.font = UIFont(name: "Roboto-Black", size: 18.0)
        descrView.font = UIFont.systemFont(ofSize: 18)
        descrView.backgroundColor = color
        descrView.text = self.descr + ":"
        descrView.textAlignment = NSTextAlignment.right;
        addSubview(descrView)
        
        let valView: UILabel = UILabel(frame: CGRect(x: frame.width / 2, y: 0, width: frame.width / 2, height: frame.height))
        valView.font = UIFont(name: "Roboto-Black", size: 18.0)
        valView.font = UIFont.systemFont(ofSize: 18)
        valView.backgroundColor = color
        valView.text = self.value
        valView.textAlignment = NSTextAlignment.left;
        addSubview(valView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







