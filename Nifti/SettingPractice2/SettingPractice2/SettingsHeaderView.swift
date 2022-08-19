//
//  SettingsHeaderView.swift
//  SettingPractice2
//
//  Created by BoMin on 2022/08/20.
//

import UIKit

class SettingsHeaderView: UIView {

    let label = UILabel()
    
    var contentHeight: CGFloat {
        label.bounds.height
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        attribute()
        layout()
    }
    
    private func attribute() {
        label.numberOfLines = 0
        backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    private func layout() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func setText(_ text: String) {
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
    }
}
