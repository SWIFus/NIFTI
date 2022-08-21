//
//  FriendsCell.swift
//  Nifti
//
//  Created by BoMin on 2022/08/17.
//

import UIKit

final class FriendsCell: UICollectionViewCell {
    static let identifier = "FriendsCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 45
        view.clipsToBounds = true
        return view
    }()
    
    let friendNameLabel: UILabel = {
        let namelabel = UILabel()
        namelabel.backgroundColor = .red
        namelabel.textColor = .white
        namelabel.font = .systemFont(ofSize: 5)
        namelabel.numberOfLines = 1
        namelabel.textAlignment = .center
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        return namelabel
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.friendNameLabel)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 7.5),
            self.imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -7.5),
//
            self.friendNameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 2),
            self.friendNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.friendNameLabel.widthAnchor.constraint(equalToConstant: self.imageView.bounds.width),
            self.friendNameLabel.centerXAnchor.constraint(equalTo: self.imageView.centerXAnchor),
//            self.friendNameLabel.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.prepare(image: nil, name: nil)
    }
    
    func prepare(image: UIImage?, name: String?) {
        self.imageView.image = image
        self.friendNameLabel.text = name
    }
    
}
