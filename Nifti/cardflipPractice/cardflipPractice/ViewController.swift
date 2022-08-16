//
//  ViewController.swift
//  cardflipPractice
//
//  Created by BoMin on 2022/08/13.
//

import UIKit

class ViewController: UIViewController {
    
    let view1: UIView = {
        let v1 = UIView()
        
        v1.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        v1.backgroundColor = .white
        v1.layer.backgroundColor = UIColor.red.cgColor
        v1.layer.cornerRadius = 25
        
        return v1
    }()
    
    let view2: UIView = {
        let v2 = UIView()
        
        v2.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        v2.backgroundColor = .white
        v2.layer.backgroundColor = UIColor.blue.cgColor
        v2.layer.cornerRadius = 25
        
        return v2
    }()
    
    var cardView: UIView = {
        let cV = UIView()
        
        cV.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        cV.backgroundColor = .white
        cV.layer.backgroundColor = UIColor.gray.cgColor
        cV.layer.cornerRadius = 25
        
        return cV
    }()
    
    let flipButton: UIButton = {
        let flip = UIButton()
        
        flip.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        flip.backgroundColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1)
        flip.setTitle("Click!", for: .normal)
        flip.addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)
        
        return flip
    }()
    
    var isV1: Bool = true

    override func viewDidLoad() {
        view.addSubview(cardView)
        view.addSubview(flipButton)
        setAutoLayouts()
    }
    
    func setAutoLayouts() {
        cardViewAutoLayout()
        flipButtonAutoLayout()
    }
    
    @objc func pressed(_ rsender: UIButton!) {
        print("button clicked")
        if isV1 {
            print("v1 -> v2")
            isV1 = false
            // cardView = view2
            cardView.addSubview(view2)
            view2AutoLayout()
            UIView.transition(with: cardView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            print("v2 -> v1")
            isV1 = true
            // cardView = view1
            cardView.addSubview(view1)
            view1AutoLayout()
            UIView.transition(with: cardView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }


}

extension ViewController {
    func cardViewAutoLayout() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        cardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    func view1AutoLayout() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        view1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view1.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor).isActive = true
        view1.centerYAnchor.constraint(equalTo: self.cardView.centerYAnchor).isActive = true
        
    }
    
    func view2AutoLayout() {
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        view2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view2.centerXAnchor.constraint(equalTo: self.cardView.centerXAnchor).isActive = true
        view2.centerYAnchor.constraint(equalTo: self.cardView.centerYAnchor).isActive = true
        
    }
    
    func flipButtonAutoLayout() {
        flipButton.translatesAutoresizingMaskIntoConstraints = false
        
        flipButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        flipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        flipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        flipButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200).isActive = true
    }
}

