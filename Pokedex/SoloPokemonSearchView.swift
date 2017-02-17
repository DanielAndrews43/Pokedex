//
//  SoloPokemonSearchView.swift
//  Pokedex
//
//  Created by Daniel Andrews on 2/16/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SoloPokemonSearchView: UIView {
    
    let soloHeight: CGFloat = 0.25
    let luckyHeight: CGFloat = 0.50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLayout(frame: CGRect) {
        let stackedView: UIStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        // Search by name
        let nameSearchView = SingleSearchHorizontalView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * soloHeight), text: "Name:")
        stackedView.addSubview(nameSearchView)
        
        // Search by number
        let numberSearchView = SingleSearchHorizontalView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * soloHeight), text: "Number:")
        stackedView.addSubview(numberSearchView)
        
        // Random Button
        let randomButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * luckyHeight))
        randomButton.titleLabel?.text = "Feeling Lucky?"
        randomButton.titleLabel?.textColor = UIColor.black
        stackedView.addSubview(randomButton)
        
        addSubview(stackedView)
    }
}

class SingleSearchHorizontalView: UIView {
    
    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        
        setLayout(text: text, frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(text: String, frame: CGRect) {
        let stackedView: UIStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        let labelWidth: CGFloat = 0.3
        let boxWidth: CGFloat = 0.5
        let buttonWidth: CGFloat = 0.2
        
        //Add label
        let nameLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width * labelWidth, height: frame.height))
        nameLabel.font = UIFont(name: "Roboto-Black", size: 15.0)
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.text = text
        nameLabel.textAlignment = NSTextAlignment.left;
        stackedView.addSubview(nameLabel)
        
        //Add Search Bar
        let searchBar: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: frame.width * boxWidth, height: frame.height))
        stackedView.addSubview(searchBar)
        
        //Add submit button
        let submitButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width * buttonWidth, height: frame.height))
        stackedView.addSubview(submitButton)
        addSubview(stackedView)
    }
}









