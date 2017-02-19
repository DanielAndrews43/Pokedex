//
//  ViewController.swift
//  Pokedex
//
//  Created by Levi Walsh and Daniel Andrews on 2/15/17.
//  Copyright © 2016 trainingprogram. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    let titleViewHeight: CGFloat = 0.15
    let scHeight: CGFloat = 0.05
    
    var soloSearchView: UIView?
    var multipleSearchView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    static func doSegue(name: String) {
        let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "resultsView") as! ResultsViewController
        
        vc.name = name
        
        let a = UIViewController()
        a.performSegue(withIdentifier: "resultsView", sender: self)
    }
    
    func setUI() {
        //Add title view that is always on top
        let titleView: UIView = setUpTitleView(height: titleViewHeight)
        view.addSubview(titleView)
        
        //Set up Segmented Control
        let scView: UIView = UIView(frame: CGRect(x: 0, y: titleView.frame.maxY, width: view.frame.width, height: view.frame.height * scHeight))
        let segments = ["Single", "Catagory"]
        let sc = UISegmentedControl(items: segments)
        sc.frame = CGRect(x: ((view.frame.width - sc.frame.width) / 2), y: ((scView.frame.height - sc.frame.height) / 2), width: sc.frame.width, height: sc.frame.height)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(changeView), for: .valueChanged)
        scView.addSubview(sc)
        view.addSubview(scView)
        
        soloSearchView = SoloPokemonSearchView(frame: CGRect(x: 0, y: scView.frame.maxY, width: view.frame.width, height: view.frame.height * (1 - scHeight - titleViewHeight)))
        soloSearchView?.backgroundColor = UIColor.blue
        view.addSubview(soloSearchView!)
        
        multipleSearchView = MultiplePokemonSearchView(frame: CGRect(x: 0, y: scView.frame.maxY, width: view.frame.width, height: view.frame.height * (1 - scHeight - titleViewHeight)))
        multipleSearchView?.backgroundColor = UIColor.yellow
    }
    
    func changeView(sender: AnyObject) {
        NSLog("We in da haus")
        if sender.selectedSegmentIndex == 0 {
            NSLog("we out here")
            if (multipleSearchView != nil) {
                multipleSearchView?.removeFromSuperview()
            }
            view.addSubview(soloSearchView!)
        } else {
            NSLog("Nah, we out here!")
            soloSearchView?.removeFromSuperview()
            view.addSubview(multipleSearchView!)
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
