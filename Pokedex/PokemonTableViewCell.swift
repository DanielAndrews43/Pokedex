//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Levi Walsh on 2/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    var pokeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Our poke Label
        pokeLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.height * (1/3), width: 150, height: contentView.frame.height * (1/3)))
        pokeLabel.textColor = UIColor.black
        contentView.addSubview(pokeLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
