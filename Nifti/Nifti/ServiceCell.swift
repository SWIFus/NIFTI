//
//  ServiceCell.swift
//  Nifti
//
//  Created by BoMin on 2022/09/19.
//

import UIKit

class ServiceCell: UICollectionViewCell {
    static let identifier = "ServiceCell"
    
    let myServiceSelectView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
//        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let myServiceSelectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(myServiceSelectView)
        self.contentView.addSubview(myServiceSelectLabel)
        setAutoLayout()
    }
    
    func setAutoLayout() {
        setImageViewAutoLayout()
        setLabelAutoLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myServiceSelectView.image = nil
        myServiceSelectLabel.text = nil
    }
    
    func prepare(image: UIImage?, label: String?) {
        self.myServiceSelectView.image = image
        self.myServiceSelectLabel.text = label
    }
}

extension ServiceCell {
    func setImageViewAutoLayout() {
        NSLayoutConstraint.activate([
            self.myServiceSelectView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//            self.myServiceSelectView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.myServiceSelectView.widthAnchor.constraint(equalToConstant: self.contentView.frame.size.height*0.8),
            self.myServiceSelectView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.myServiceSelectView.heightAnchor.constraint(equalToConstant: self.contentView.frame.size.height*0.8),
//            self.myServiceSelectView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    func setLabelAutoLayout() {
        NSLayoutConstraint.activate([
            self.myServiceSelectLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
//            self.myServiceSelectLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.myServiceSelectLabel.widthAnchor.constraint(equalToConstant: self.contentView.frame.size.height*0.8),
            self.myServiceSelectLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.myServiceSelectLabel.topAnchor.constraint(equalTo: self.myServiceSelectView.bottomAnchor),
        ])
    }
}
