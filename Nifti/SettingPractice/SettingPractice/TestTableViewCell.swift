//
//  TestTableViewCell.swift
//  SettingPractice
//
//  Created by BoMin on 2022/08/18.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    static let cellID = "CellId"
    
    let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        self.addSubview(nameLabel)
        nameLabelAutoLayouts()
    }
    
    func nameLabelAutoLayouts() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
