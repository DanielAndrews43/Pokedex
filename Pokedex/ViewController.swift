//
//  ViewController.swift
//  Pokedex
//
//  Created by Levi Walsh and Daniel Andrews on 2/15/17.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    let titleViewHeight: CGFloat = 0.15
    let soloSearchViewHeight: CGFloat = 0.25
    let filteredSearchViewHeight: CGFloat = 0.5
    let searchViewHeight: CGFloat = 0.1
    
    let paramsSubViewHeight: CGFloat = 0.5
    let typesSubViewHeight: CGFloat = 0.5
    
    func setUI() {
        let stackedView = UIStackView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(stackedView)
        
        let titleView: UIView = setUpTitleView(height: titleViewHeight)
        stackedView.addSubview(titleView)
        
        let soloSearchView: UIView = setUpSoloSearchView(start: titleView.frame.maxY, height: soloSearchViewHeight)
        view.addSubview(soloSearchView)
        
        let filteredSearchView: UIView = setUpfilteredSearchView(start: soloSearchView.frame.maxY, height: soloSearchViewHeight)
        view.addSubview(filteredSearchView)
        
        let searchView: UIView = setUpSearchView(start: filteredSearchView.frame.maxY, height: searchViewHeight)
        view.addSubview(searchView)
        
        var def = 0
var hp = 0
var att = 0
      for poke in PokemonGenerator.getPokemonArray() {
          if poke.attack > att {
              att = poke.attack
               }
      if poke.health > hp {
hp = poke.health
}
if poke.defense > def {
def = poke.defense
            }
}

NSLog(String(def) + " " + String(hp) + " " + String(att))
        
    }
    
    
    // Title Bar View
    func setUpTitleView(height: CGFloat) -> UIView {
        let newView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * height))
        
        
        //For aesthetic purposes, fix at the end
//        let border = CALayer()
//        border.borderColor = UIColor.darkGray.cgColor
//        border.frame = CGRect(x: 0, y: 0, width: newView.frame.width, height: newView.frame.height)
//        border.borderWidth = CGFloat(2.0)
//        newView.layer.addSublayer(border)
//        newView.layer.masksToBounds = true
        
        let header: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: newView.frame.width, height: newView.frame.height))
        header.font = UIFont(name: "Roboto-Black", size: 32.0)
        header.font = UIFont.systemFont(ofSize: 32)
        header.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        header.text = "Search"
        header.textAlignment = NSTextAlignment.center;
        newView.addSubview(header)
        
        return newView
    }
    
    // Solo Search View
    func setUpSoloSearchView(start: CGFloat, height: CGFloat) -> UIView {
        let newView: UIView = UIView(frame: CGRect(x:0, y:start, width: view.frame.width, height: height * view.frame.height))
        
        // Search by name
        let promptName: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: newView.frame.width * 0.3, height: newView.frame.height / 3))
        promptName.font = UIFont(name: "Roboto-Black", size: 32.0)
        promptName.font = UIFont.systemFont(ofSize: 32)
        promptName.backgroundColor = UIColor.init(red: 245/255, green: 140/255, blue: 140/255, alpha: 1)
        promptName.text = "Name:"
        promptName.textAlignment = NSTextAlignment.left;
        newView.addSubview(promptName)
        
        let promptName2: UILabel = UILabel(frame: CGRect(x: newView.frame.width * 0.3, y: 0, width: newView.frame.width * 0.3, height: newView.frame.height / 3))
        promptName2.font = UIFont(name: "Roboto-Black", size: 32.0)
        promptName2.font = UIFont.systemFont(ofSize: 32)
        promptName2.backgroundColor = UIColor.init(red: 245/255, green: 140/255, blue: 140/255, alpha: 1)
        promptName2.text = "Got him"
        promptName2.textAlignment = NSTextAlignment.left;
        newView.addSubview(promptName2)
        
        
        
        
        // Search by name
        let promptNumber: UILabel = UILabel(frame: CGRect(x: 0, y: newView.frame.height / 3, width: newView.frame.width / 3, height: newView.frame.height / 3))
        promptNumber.font = UIFont(name: "Roboto-Black", size: 32.0)
        promptNumber.font = UIFont.systemFont(ofSize: 32)
        promptName.backgroundColor = UIColor.init(red: 245/255, green: 140/255, blue: 140/255, alpha: 1)
        promptNumber.text = "Number:"
        promptNumber.textAlignment = NSTextAlignment.left;
        newView.addSubview(promptNumber)
        
        
        // Random Button
        let randomButton: UIButton = UIButton(frame: CGRect(x: 0, y: newView.frame.height * 2/3, width: newView.frame.width / 3, height: newView.frame.height / 3))
        randomButton.titleLabel?.text = "Feeling Lucky?"
        randomButton.titleLabel?.textColor = UIColor.black
        randomButton.alignmentRect(forFrame: CGRect(x: newView.frame.width / 2, y: newView.frame.height * 2 / 3, width: newView.frame.width / 3, height: newView.frame.height / 3))
        
        
        return newView
    }

    // Filtered Search View
    func setUpfilteredSearchView(start: CGFloat, height: CGFloat) -> UIView {
        let newView: UIView = UIView(frame: CGRect(x: 0, y: start, width: view.frame.width, height: height * view.frame.height))
        
        
        return newView
    }
    
    //Search Button View
    func setUpSearchView(start: CGFloat, height: CGFloat) -> UIView {
        let newView: UIView = UIView(frame: CGRect(x: 0, y: start, width: view.frame.width, height: height * view.frame.height))
        
        return newView
    }
    

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

