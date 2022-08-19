//
//  NiftiPetViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/14.
//

import UIKit

class NiftiPetViewController: UIViewController {
    
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
        let petImage = UIImageView.init(image: UIImage(named: "dongri-circle-default.png"))
        
        petImage.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        petImage.contentMode = .scaleAspectFit
        
//        petImage.layer.masksToBounds = false
//        petImage.layer.shadowColor = UIColor.black.cgColor
//        petImage.layer.shadowOffset = CGSize(width: 0, height: 20)
//        petImage.layer.shadowOpacity = 0.8
//        petImage.layer.shadowRadius = 5.0
        
        return petImage
        
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
        
        
        petSquareViewAutoLayout()
        petImageViewAutoLayout()
        
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
}
