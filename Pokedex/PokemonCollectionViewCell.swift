//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Levi Walsh on 2/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    var pokemonImageView: UIImageView!
    var pokeLabel: UILabel!
    
    override func awakeFromNib() {
        pokemonImageView = UIImageView(frame: contentView.frame)
        pokemonImageView.contentMode = .scaleAspectFill
        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView) // Add UI elements to the contentView not to the cell itself
        
        pokeLabel = UILabel(frame: CGRect(x: 0, y: contentView.frame.maxX * 0.9, width: contentView.frame.width / 3, height: contentView.frame.height / 10))
        pokeLabel.backgroundColor = UIColor.red
        pokeLabel.text = "Pokemon Name"
        pokeLabel.layer.cornerRadius = 3
        pokeLabel.clipsToBounds = true
        contentView.addSubview(pokeLabel)
        
    }
}
