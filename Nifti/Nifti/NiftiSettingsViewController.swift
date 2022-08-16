//
//  NiftiSettingsViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/17.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: ((()-> Void))
}

class NiftiSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
        return table
    }()
    
    var models = [SettingsOption]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        self.view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)

    }
    
    func configure() {
        self.models = Array(0...100).compactMap({
            SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsTableViewCell.identifier,
            for: indexPath
        ) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell

    }

}
