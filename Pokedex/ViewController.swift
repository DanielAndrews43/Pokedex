//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
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
    let paramSearchViewHeight: CGFloat = 0.5
    let searchView: CGFloat = 0.1
    
    let paramsSubViewHeight: CGFloat = 0.5
    let typesSubViewHeight: CGFloat = 0.5
    
    func setUI() {
        let stackedView = UIStackView.init(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        let titleView: UIView = setUpTitleView(height: titleViewHeight)
        stackedView.addSubview(titleView)
        
        let soloSearchView: UIView = setUpSoloSearchView(start: titleView.frame.maxY, height: soloSearchViewHeight)
        view.addSubview(soloSearchView)
        
        view.addSubview(stackedView)
    }
    
    func setUpSoloSearchView(start: CGFloat, height: CGFloat) -> UIView {
        let newView: UIView = UIView(frame: CGRect(x:0, y:start, width: view.frame.width, height: height * view.frame.height))
        
        
        
        return newView
    }
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

