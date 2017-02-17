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
        
        let hpView: UIView = SliderView(frame: CGRect(x: 0, y: defView.frame.minY, width: frame.width, height: frame.height * slideHeight), title: "Min HP", type: "hp")
        addSubview(hpView)
        
        let attView: UIView = SliderView(frame: CGRect(x: 0, y: hpView.frame.maxY, width: frame.width, height: frame.height * slideHeight), title: "Min Attack", type: "att")
        addSubview(attView)
        
    }
}

class SliderView: UIView {
    var title: String!
    var type: String!
    
    var defSlider: UISlider!
    var hpSlider: UISlider!
    var attSlider: UISlider!
    
    var defSliderLabel: UILabel!
    var hpSliderLabel: UILabel!
    var attSliderLabel: UILabel!
    
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
        number.text = String(slider.value)
        number.font = UIFont.systemFont(ofSize: 18)
        addSubview(number)
        
        if type == "def" {
            slider.maximumValue = 230
            defSlider = slider
            slider.addTarget(self, action: #selector(defSliderUpdate), for: .touchUpInside)
            defSliderLabel = number
        } else if type == "hp" {
            slider.maximumValue = 255
            hpSlider = slider
            slider.addTarget(self, action: #selector(hpSliderUpdate), for: .touchUpInside)
            hpSliderLabel = number
        } else if type == "att" {
            slider.maximumValue = 190
            attSlider = slider
            slider.addTarget(self, action: #selector(attSliderUpdate), for: .touchUpInside)
            attSliderLabel = number
        }
    }
    
    func defSliderUpdate() {
        defSliderLabel.text = String(defSlider.value)
    }
    
    func hpSliderUpdate() {
        hpSliderLabel.text = String(hpSlider.value)
    }
    
    func attSliderUpdate() {
        attSliderLabel.text = String(attSlider.value)
    }
}
