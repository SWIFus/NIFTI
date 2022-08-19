//
//  NiftiSettingsViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/17.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: ((()-> Void))
}

class NiftiSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.present(UINavigationController(rootViewController: NiftiSettingsViewController()), animated:true, completion: nil)
        navigationItem.title = "Settings"
//        self.view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        configure()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        

    }
    
    func configure() {
        models.append(Section(title: "보안", options: [
            SettingsOption(title: "비밀번호 설정", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped 비밀번호 설정")
            },
            SettingsOption(title: "비공개 설정", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                print("Tapped 비공개 설정")
            },
            SettingsOption(title: "고객 센터", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("Tapped 고객 센터")
            },
        ]))
        
        models.append(Section(title: "계정", options: [
            SettingsOption(title: "Repair Code", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Tapped Repair Code")
            },
            SettingsOption(title: "로그아웃", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                print("Tapped 로그아웃")
            },
            SettingsOption(title: "계정 탈퇴", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("Tapped 계정 탈퇴")
            },
        ]))
        
        models.append(Section(title: " ", options: [
            SettingsOption(title: "개인 정보 보호 관련 안내", icon: UIImage(systemName: "key"), iconBackgroundColor: .systemPink) {
                print("Tapped 개인 정보 보호 관련 안내")
            },
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsTableViewCell.identifier,
            for: indexPath
        ) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }

}
