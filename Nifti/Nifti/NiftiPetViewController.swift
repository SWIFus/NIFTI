//
//  NiftiPetViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/14.
//

import UIKit

class NiftiPetViewController: UIViewController {
    
    let colorSet = [
        UIColor(red: 0.835, green: 0.978, blue: 0.987, alpha: 1),
        UIColor(red: 0.976, green: 0.384, blue: 0.384, alpha: 1),
        UIColor(red: 1, green: 0.979, blue: 0.462, alpha: 1),
        UIColor(red: 0.592, green: 0.996, blue: 0.659, alpha: 1),
        UIColor(red: 0.458, green: 0.454, blue: 0.434, alpha: 1)
    ]
    
    let petSquareView: UIView = {
        let petSquare = UIView()
        
        petSquare.frame = CGRect(x: 0, y: 0, width: 280, height: 280)
        petSquare.backgroundColor = .white
        
        petSquare.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1).cgColor
        petSquare.layer.cornerRadius = 40
        
        // shadow - outside
//        petSquare.layer.borderWidth = 1
//        petSquare.layer.masksToBounds = false
//        petSquare.layer.shadowColor = UIColor.black.cgColor
//        petSquare.layer.shadowOffset = CGSize(width: 0, height: 20)
//        petSquare.layer.shadowOpacity = 0.8
//        petSquare.layer.shadowRadius = 5.0
        
        return petSquare
    }()
    
    let petImageView: UIImageView = {
        let petImage = UIImageView.init(image: UIImage(named: "dongri-default.png"))
        
        petImage.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        petImage.contentMode = .scaleAspectFit
        
//        petImage.layer.masksToBounds = false
//        petImage.layer.shadowColor = UIColor.black.cgColor
//        petImage.layer.shadowOffset = CGSize(width: 0, height: 20)
//        petImage.layer.shadowOpacity = 0.8
//        petImage.layer.shadowRadius = 5.0
        
        return petImage
        
    }()
    
    let commingSoonLabel: UILabel = {
        let commingSoon = UILabel()
        
//        commingSoon.backgroundColor = .red
        commingSoon.textColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 0.8)
        commingSoon.font = .systemFont(ofSize: 15)
        
        commingSoon.text = "Comming Soon"
        commingSoon.textAlignment = .center
        
        return commingSoon
    }()
    
    let connectToApps: UIView = {
        let connect = UIView()
        
        connect.frame = CGRect(x: 0, y: 0, width: 320, height: 280)
        connect.backgroundColor = .white
        connect.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 0.9).cgColor
        connect.layer.cornerRadius = 40
        
        return connect
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAutoLayouts()
        
    }
    
    func setView() {
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func setAutoLayouts() {
        self.view.addSubview(petSquareView)
        self.view.addSubview(petImageView)
        
        self.view.addSubview(connectToApps)
        self.connectToApps.addSubview(commingSoonLabel)
        
        petSquareViewAutoLayout()
        petImageViewAutoLayout()
        
        connectToAppsAutoLayout()
        commingSoonLabelAutoLayout()
        
    }
    
}

extension NiftiPetViewController {
    func petSquareViewAutoLayout() {
        petSquareView.translatesAutoresizingMaskIntoConstraints = false
        
        let petSquareViewConstraints = [
            // set width & height anchors
            petSquareView.widthAnchor.constraint(equalToConstant: 280),
            petSquareView.heightAnchor.constraint(equalTo: petSquareView.widthAnchor),
            
            // set other anchors
            petSquareView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            petSquareView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128)
        ]
        
        NSLayoutConstraint.activate(petSquareViewConstraints)
    }
    
    func petImageViewAutoLayout() {
        petImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let petImageViewConstraints = [
            // set width & height anchors
            petImageView.widthAnchor.constraint(equalToConstant: 150),
            petImageView.heightAnchor.constraint(equalToConstant: 150),
            
            // set other anchors
            petImageView.centerXAnchor.constraint(equalTo: self.petSquareView.centerXAnchor),
            petImageView.centerYAnchor.constraint(equalTo: self.petSquareView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(petImageViewConstraints)
    }
    
    func connectToAppsAutoLayout() {
        connectToApps.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        connectToApps.widthAnchor.constraint(equalToConstant: self.view.frame.size.width * 0.8).isActive = true
        connectToApps.heightAnchor.constraint(equalToConstant: self.view.frame.size.height * 0.3).isActive = true
        
        // set other anchors
        connectToApps.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        connectToApps.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.size.height * 0.225).isActive = true
//        connectToApps.topAnchor.
    }
    
    func commingSoonLabelAutoLayout() {
        commingSoonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let commingSoonLabelConstraints = [
            // set width & height anchors
            commingSoonLabel.widthAnchor.constraint(equalToConstant: self.connectToApps.frame.size.width * 0.8),
            commingSoonLabel.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height * 0.2),
            
            // set other anchors
            commingSoonLabel.centerXAnchor.constraint(equalTo: self.connectToApps.centerXAnchor),
            commingSoonLabel.centerYAnchor.constraint(equalTo: self.connectToApps.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(commingSoonLabelConstraints)
    }
}
