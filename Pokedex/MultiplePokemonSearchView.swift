//
//  MultiplePokemonSearchView.swift
//  Pokedex
//
//  Created by Daniel Andrews on 2/16/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class MultiplePokemonSearchView: UIView {

    let slideHeight: CGFloat = 0.15
    let searchHeight: CGFloat = 0.15
    let types: [String] = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    
    var defView: SliderView!
    var hpView: SliderView!
    var attView: SliderView!
    var butts: [TypeButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(frame: CGRect) {
        let defView: UIView = SliderView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * slideHeight), title: "Min Defense", type: "def")
        addSubview(defView)
        self.defView = defView as! SliderView
        
        let hpView: UIView = SliderView(frame: CGRect(x: 0, y: defView.frame.maxY, width: frame.width, height: frame.height * slideHeight), title: "Min HP", type: "hp")
        addSubview(hpView)
        self.hpView = hpView as! SliderView
        
        let attView: UIView = SliderView(frame: CGRect(x: 0, y: hpView.frame.maxY, width: frame.width, height: frame.height * slideHeight), title: "Min Attack", type: "att")
        addSubview(attView)
        self.attView = attView as! SliderView
        
        
        var xCoord: CGFloat = 0
        var yCoord: CGFloat = attView.frame.maxY
        let buttHeight = (frame.height - slideHeight * 3 * frame.height - searchHeight * frame.height) / 3
        
        for i in 0...2 {
            xCoord = 0
            for j in 0...5 {
                let newButt: TypeButton = TypeButton(frame: CGRect(x: xCoord, y: yCoord, width: frame.width / 6, height: buttHeight),
                                                     text: types[i*6 + j], x: xCoord, y: yCoord)
                
                addSubview(newButt)
                butts.append(newButt)
                xCoord += frame.width / 6
            }
            yCoord += buttHeight
        }
        
        let searchView: UIView = UIView(frame: CGRect(x: 0, y: yCoord, width: frame.width, height: frame.height * searchHeight))
        let searchButton: UIButton = UIButton(frame: CGRect(x: searchView.frame.width / 3, y: searchView.frame.height / 3, width: searchView.frame.width / 3, height: searchView.frame.height / 3))
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        searchButton.backgroundColor = UIColor.lightGray
        searchButton.setTitleColor(UIColor.black, for: .normal)
        searchButton.setTitle("Search", for: .normal)
        searchView.addSubview(searchButton)
        addSubview(searchView)
    }
    
    func search() {
        //Send the search request over
        var types: [String] = []
        
        for butt in butts {
            if butt.isSelected {
                types.append(butt.title)
            }
        }
        
        NSLog(String(self.defView.slider.value))
        NSLog(String(self.hpView.slider.value))
        NSLog(String(self.attView.slider.value))
        for type in types {
            NSLog(type)
        }
    }
}

class TypeButton: UIView {
    var title: String!
    var isSelected: Bool = false
    var butt: UIButton!
    
    init(frame: CGRect, text: String, x: CGFloat, y: CGFloat) {
        super.init(frame: frame)
        
        self.title = text

        let butt: UIButton = UIButton(frame: CGRect(x: 0, y:0, width: frame.width, height: frame.height))
        butt.addTarget(self, action: #selector(buttTapped), for: .touchUpInside)
        butt.backgroundColor = UIColor.cyan
        butt.setTitleColor(UIColor.black, for: .normal)
        butt.setTitle(self.title, for: .normal)
        butt.titleLabel?.adjustsFontSizeToFitWidth = true
        self.butt = butt
        addSubview(butt)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttTapped() {
        self.isSelected = !self.isSelected
        NSLog("touched: " + self.title)
        
        if self.isSelected {
            self.butt.backgroundColor = UIColor.green
        } else {
            self.butt.backgroundColor = UIColor.cyan
        }
    }
}

class SliderView: UIView {
    var title: String!
    var type: String!
    
    var slider: UISlider!
    
    var sliderLabel: UILabel!
    
    init(frame: CGRect, title: String, type: String) {
        super.init(frame: frame)
        
        self.title = title
        self.type = type
        setLayout(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(frame: CGRect) {
        let title: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 3))
        title.text = self.title
        title.font = UIFont.systemFont(ofSize: 18)
        addSubview(title)
        
        let slider: UISlider = UISlider(frame: CGRect(x: 0, y: title.frame.maxY, width: frame.width * 0.8, height: frame.height * 2 / 3))
        slider.isContinuous = true
        addSubview(slider)
        
        let number: UILabel = UILabel(frame: CGRect(x: slider.frame.maxX + 0.02 * frame.width, y: 0, width: frame.width * 0.18, height: frame.height))
        number.text = String(Int(slider.value))
        number.font = UIFont.systemFont(ofSize: 18)
        addSubview(number)
        
        self.slider = slider
        self.sliderLabel = number
        slider.addTarget(self, action: #selector(sliderUpdate), for: .touchUpInside)
        
        if type == "def" {
            slider.maximumValue = 230
        } else if type == "hp" {
            slider.maximumValue = 255
        } else if type == "att" {
            slider.maximumValue = 190
        }
    }
    
    func sliderUpdate() {
        self.sliderLabel.text = String(Int(self.slider.value))
    }
}
