//
//  PetSelectCollectionViewCell.swift
//  Nifti
//
//  Created by BoMin on 2022/08/21.
//

import UIKit

class PetCell: UICollectionViewCell {
    static let identifier = "PetCell"
    
    let myPetSelectView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(myPetSelectView)
        
        NSLayoutConstraint.activate([
            self.myPetSelectView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.myPetSelectView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.myPetSelectView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.myPetSelectView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myPetSelectView.image = nil
    }
    
    func prepare(image: UIImage?) {
        self.myPetSelectView.image = image
    }
}
