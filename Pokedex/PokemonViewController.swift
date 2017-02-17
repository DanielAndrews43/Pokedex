//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Levi Walsh on 2/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    //@IBOutlet weak var pokePhoto: UIImageView!
    
    
    override func awakeFromNib() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        //let number: Int = 13
        let name: String = "Pikachu"
        
        // pokemon will be found based on if a name or number are passed in
        
        let pokemon: Pokemon = SearchPokemon.findPokemon(name: name)!
        setUI(pokemon: pokemon)
        
    }
    
    
    
    func setUI(pokemon: Pokemon) {
        
        
        
        //Creates picture and fills it to be a square on the screen
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageView.frame = CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.width)
        imageView.image = pokemon.getImage()
        view.addSubview(imageView)
        

        let specStartingHeight: CGFloat = imageView.frame.height
        
        // Attack
        let attackView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight, width: view.frame.width, height: specStartingHeight * 1/9))
        attackView.font = UIFont(name: "Roboto-Black", size: 20.0)
        attackView.font = UIFont.systemFont(ofSize: 20)
        attackView.backgroundColor = UIColor.red
        attackView.text = "Attack: " + String(pokemon.attack)
        attackView.textAlignment = NSTextAlignment.left;
        view.addSubview(attackView)
        
        // Defense
        let defenseView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 10/9, width: view.frame.width, height: specStartingHeight * 1/9))
        defenseView.font = UIFont(name: "Roboto-Black", size : 20.0)
        defenseView.font = UIFont.systemFont(ofSize: 20)
        defenseView.backgroundColor = UIColor.white
        defenseView.text = "Defense: " + String(pokemon.defense)
        defenseView.textAlignment = NSTextAlignment.left;
        view.addSubview(defenseView)

        // Health
        let healthView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 11/9, width: view.frame.width, height: specStartingHeight * 1/9))
        healthView.font = UIFont(name: "Roboto-Black", size: 20.0)
        healthView.font = UIFont.systemFont(ofSize: 20)
        healthView.backgroundColor = UIColor.red
        healthView.text = "hitpoints: " + String(pokemon.health)
        healthView.textAlignment = NSTextAlignment.left;
        view.addSubview(healthView)
        
        // Special Attack
        let specialAttackView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 12/9, width: view.frame.width, height: specStartingHeight * 1/9))
        specialAttackView.font = UIFont(name: "Roboto-Black", size: 20.0)
        specialAttackView.font = UIFont.systemFont(ofSize: 20)
        specialAttackView.backgroundColor = UIColor.white
        specialAttackView.text = "Special Attack: " + String(pokemon.specialAttack)
        specialAttackView.textAlignment = NSTextAlignment.left;
        view.addSubview(specialAttackView)
        
        // Special Defense
        let specialDefenseView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 13/9, width: view.frame.width, height: specStartingHeight * 1/9))
        specialDefenseView.font = UIFont(name: "Roboto-Black", size: 20.0)
        specialDefenseView.font = UIFont.systemFont(ofSize: 20)
        specialDefenseView.backgroundColor = UIColor.red
        specialDefenseView.text = "Special Defense: " + String(pokemon.specialDefense)
        specialDefenseView.textAlignment = NSTextAlignment.left;
        view.addSubview(specialDefenseView)
        
        // Species
        let speciesView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 14/9, width: view.frame.width, height: specStartingHeight * 1/9))
        speciesView.font = UIFont(name: "Roboto-Black", size: 20.0)
        speciesView.font = UIFont.systemFont(ofSize: 20)
        speciesView.backgroundColor = UIColor.white
        speciesView.text = "Species: " + String(pokemon.species)
        speciesView.textAlignment = NSTextAlignment.left;
        view.addSubview(speciesView)
        
        // Speed
        let speedView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 15/9, width: view.frame.width, height: specStartingHeight * 1/11))
        speedView.font = UIFont(name: "Roboto-Black", size: 20.0)
        speedView.font = UIFont.systemFont(ofSize: 20)
        speedView.backgroundColor = UIColor.red
        speedView.text = "Speed: " + String(pokemon.speed)
        speedView.textAlignment = NSTextAlignment.left;
        view.addSubview(speedView)
        
        // Total
        let totalView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 16/9, width: view.frame.width, height: specStartingHeight * 1/9))
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
        let typesView: UILabel = UILabel(frame: CGRect(x: 0, y: specStartingHeight * 17/9, width: view.frame.width, height: specStartingHeight * 1/9))
        typesView.font = UIFont(name: "Roboto-Black", size: 20.0)
        typesView.font = UIFont.systemFont(ofSize: 20)
        typesView.backgroundColor = UIColor.red
        typesView.text = "Type: " + words
        typesView.textAlignment = NSTextAlignment.left;
        view.addSubview(typesView)
        
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
    

class pokeSpecs: UIView {
    
    var attack: String!
    var defense: String!
    var hitpoints: String!
    var specialAttack: String!
    var specialDefense: String!
    var species: String!
    var speed: String!
    var total: String!
    var type: String!
    
    
    init(frame: CGRect, attack: String, defense: String, hitpoints: String, specialAttack: String, specialDefense: String, species: String, speed: String, total: String, type: String) {
        super.init(frame: frame)
        self.attack = attack
        self.defense = defense
        self.hitpoints = hitpoints
        self.specialAttack = specialAttack
        self.specialDefense = specialDefense
        self.species = species
        self.speed = speed
        self.total = total
        self.type = type
        self.backgroundColor = UIColor.red 
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        //let pictureView
        
        
    }
    
    
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
