//
//  SoloPokemonSearchView.swift
//  Pokedex
//
//  Created by Daniel Andrews on 2/16/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SoloPokemonSearchView: UIView {
    
    let soloHeight: CGFloat = 0.15
    let luckyHeight: CGFloat = 0.70
    
    var name: SingleSearchHorizontalView!
    var number: SingleSearchHorizontalView!
    
    var delegate: SegueHandler!
    
    var random = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLayout(frame: CGRect) {
        
        let nameSubview: SingleSearchHorizontalView = SingleSearchHorizontalView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * soloHeight), text: "Name:", isName: true)
        nameSubview.backgroundColor = UIColor.red
        name = nameSubview
        addSubview(nameSubview)
        
        let numberSubview: SingleSearchHorizontalView = SingleSearchHorizontalView(frame: CGRect(x: 0, y: nameSubview.frame.maxY, width: frame.width, height: frame.height * soloHeight), text: "Number:", isName: false)
        numberSubview.backgroundColor = UIColor.red
        number = numberSubview
        addSubview(numberSubview)
        
        let randomButtonSubview: UIView = UIView(frame: CGRect(x: 0, y: numberSubview.frame.maxY, width: frame.width, height: frame.height * luckyHeight))
        let randomButton: UIButton = UIButton.init(frame: CGRect(x: frame.width * 0.12, y: randomButtonSubview.frame.height * 0.4, width: frame.width * 0.76, height: randomButtonSubview.frame.height * 0.2))
        randomButton.backgroundColor = UIColor.red
        randomButton.addTarget(self, action: #selector(randomPokemon), for: .touchUpInside)
        randomButton.setTitle("Get Random Pokemon", for: .normal)
        randomButton.setTitleColor(UIColor.black, for: .normal)
        randomButtonSubview.addSubview(randomButton)
        addSubview(randomButtonSubview)
    }
    
    func randomPokemon() {
        random = true
        NSLog("random 20")
        delegate.segueToNext(identifier: "searchToResults")
    }
}

class SingleSearchHorizontalView: UIView {
    
    var nameField: UITextField!
    var numberField: UITextField!
    
    init(frame: CGRect, text: String, isName: Bool) {
        super.init(frame: frame)
        
        setLayout(text: text, frame: frame, isName: isName)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLayout(text: String, frame: CGRect, isName: Bool) {
        

        
        let labelWidth: CGFloat = 0.3
        let boxWidth: CGFloat = 0.5
        let buttonWidth: CGFloat = 0.2
        
        //Add label
        let nameLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width * labelWidth, height: frame.height))
        nameLabel.font = UIFont(name: "Roboto-Black", size: 15.0)
        nameLabel.font = UIFont.systemFont(ofSize: 26)
        nameLabel.text = text
        nameLabel.textAlignment = NSTextAlignment.right
        addSubview(nameLabel)
        
        //Add Search Bar
        let searchView: UIView = UIView(frame: CGRect(x: nameLabel.frame.maxX, y: 0, width: frame.width * boxWidth, height: frame.height))
        let searchBar: UITextField = UITextField(frame: CGRect(x: searchView.frame.width * 0.05, y: searchView.frame.height * 0.25, width: searchView.frame.width * 0.9, height: frame.height * 0.5))
        if isName{
            nameField = searchBar
        } else {
            numberField = searchBar
        }
        searchBar.borderStyle = UITextBorderStyle.line
        searchBar.backgroundColor = UIColor.white
        searchView.addSubview(searchBar)
        addSubview(searchView)
        
        //Add submit button
        let buttonView: UIView = UIView(frame: CGRect(x: searchView.frame.maxX, y: 0, width: frame.width * buttonWidth, height: frame.height))
        let submitButton: UIButton = UIButton.init(frame: CGRect(x: 0, y: buttonView.frame.height * 0.3, width: buttonView.frame.width * 0.8, height: buttonView.frame.height * 0.4))
        submitButton.backgroundColor = UIColor.gray
        submitButton.setTitle("Go", for: .normal)
        submitButton.setTitleColor(UIColor.black, for: .normal)
        if isName {
            submitButton.addTarget(self, action: #selector(nameSearch), for: .touchUpInside)
        } else {
            submitButton.addTarget(self, action: #selector(numberSearch), for: .touchUpInside)
        }
        buttonView.addSubview(submitButton)
        addSubview(buttonView)
    }
    
    func nameSearch() {
        //Call on name search
        NSLog("name clicked: " + nameField.text!)
        
    }
    
    func numberSearch() {
        NSLog("number clicked: " + numberField.text!)
    }
}

