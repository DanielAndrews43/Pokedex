//
//  ResultsViewController.swift
//  Pokedex
//
//  Created by Daniel Andrews on 2/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var collectionView: UICollectionView!
    var tableView: UITableView!
    
    var name: String?
    var number: Int?
    var random: Bool = false
    
    var minAtt: Int?
    var minDef: Int?
    var minHP: Int?
    var types: [String]?
    
    var scHeight: CGFloat = 0.05
    
    var pokeRay: [Pokemon]!
    
    
    var images = [SearchPokemon.findPokemon(name: "Pikachu")?.getImage(), SearchPokemon.findPokemon(name: "Eevee")?.getImage(), SearchPokemon.findPokemon(name: "Squirtle")?.getImage(), SearchPokemon.findPokemon(name: "Snorlax")?.getImage(), SearchPokemon.findPokemon(name: "Ditto")?.getImage()]
    var names = [SearchPokemon.findPokemon(name: "Pikachu")?.name, SearchPokemon.findPokemon(name: "Eevee")?.name, SearchPokemon.findPokemon(name: "Squirtle")?.name, SearchPokemon.findPokemon(name: "Snorlax")?.name, SearchPokemon.findPokemon(name: "Ditto")?.name]
    
    
    func getPokemonArray() -> [Pokemon] {
        if name != nil {
            return [SearchPokemon.findPokemon(name: name!)!]
        } else if number != nil {
            return [SearchPokemon.findPokemon(number: number!)!]
        } else if random {
            return SearchPokemon.findRandomPokemon()
        } else if minAtt != nil {
            return SearchPokemon.findPokemon(minAttack: minAtt!, minDef: minDef!, minHP: minHP!, types: types!)!
        }
        
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pokeRay = getPokemonArray()
        
        setupCollectionView()
        setupTableView()
        
        let scView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * scHeight))
        let segments = ["Grid", "List"]
        let sc = UISegmentedControl(items: segments)
        sc.frame = CGRect(x: ((view.frame.width - sc.frame.width) / 2), y: ((scView.frame.height - sc.frame.height) / 2), width: sc.frame.width, height: sc.frame.height)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(changeView), for: .valueChanged)
        scView.addSubview(sc)
        view.addSubview(scView)
    }
    
    func changeView(sender: AnyObject) {
        NSLog("We in da haus")
        if sender.selectedSegmentIndex == 0 {
            setupCollectionView()
        } else {
            setupTableView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView(){
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: scHeight * view.frame.height, width: view.frame.width, height: view.frame.height))
        //Register the tableViewCell you are using
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "nameCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x:0, y: scHeight*view.frame.height, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "pokemonCell")
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}



extension ResultsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //What do we want to return here
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! PokemonTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.pokeImageView.image = images[indexPath.row]
        cell.pokeLabel.text = names[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // fruitToPass = images[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonVC", sender: self)
    }
}



extension ResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //specifying the number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //Make the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    //Fill in the cell with information
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonCollectionViewCell
        pokemonCell.pokemonImageView.image = images[indexPath.row]
    }
    
    //Sizes the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    // Clicking buttons changes to the pokemon individual page
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}


