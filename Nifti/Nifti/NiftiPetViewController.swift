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
        
        return petSquare
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
        
        
        petSquareViewAutoLayout()
        
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
}
