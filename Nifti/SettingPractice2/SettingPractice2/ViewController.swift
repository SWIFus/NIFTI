//
//  ViewController.swift
//  SettingPractice2
//
//  Created by BoMin on 2022/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    let table = UITableView()
    
    let tableHeaderView = SettingsHeaderView()
    
    let dataList = InfoSettingSection.generateData()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        view.addSubview(table)
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        table.separatorColor = .white
        table.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        setTableAutoLayout()
        headerViewLayout()
        setHeaderViewContent()
    }
    
    func setTableAutoLayout() {
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func headerViewLayout() {
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
    }
    
    func setHeaderViewContent() {
        tableHeaderView.setText("Settings")
        table.tableHeaderView = tableHeaderView
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let target = dataList[indexPath.section].items[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
        
        cell.textLabel?.text = target.title
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataList[section].header
    }
    
}

