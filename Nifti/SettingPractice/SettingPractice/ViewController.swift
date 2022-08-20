//
//  ViewController.swift
//  SettingPractice
//
//  Created by BoMin on 2022/08/18.
//

import UIKit

class ViewController: UIViewController {

    let table = UITableView()
    
    let tableHeaderView = settingHeaderView()
    
    let testArray = ["a", "b", "c", "d", "e", "a", "b", "c", "d", "e"]
    
    struct Sect {
        let name: String
    }

    
    let sect: [Sect] = [
        [Sect(name: "안녕"),
         Sect(name: "하세요"),
         Sect(name: "저는"),
         Sect(name: "동물의숲을합니다") ],
//
//        [Sect(name: "안녕"),
//         Sect(name: "하세요"),
//         Sect(name: "저는"),
//         Sect(name: "포켓몬을합니다") ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
    }
    
    func attribute() {
        table.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.cellID)
        table.delegate = self
        table.dataSource = self
        tableHeaderView.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
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
    
//    func setHeader() {
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.table.frame.size.width, height: 100))
//
//        header.backgroundColor = .systemGreen
//        header.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            header.heightAnchor.constraint(equalToConstant: 100),
//            header.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
//        ])
//
//        table.tableHeaderView = header
//
//        let headerLabel = UILabel(frame: header.bounds)
//        headerLabel.text = "This is Header View"
//        headerLabel.textColor = .systemOrange
//        headerLabel.textAlignment = .center
//
//        headerLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            headerLabel.heightAnchor.constraint(equalToConstant: table.frame.size.height*0.2),
//            headerLabel.widthAnchor.constraint(equalToConstant: table.frame.size.width/2),
//            headerLabel.centerXAnchor.constraint(equalTo: table.centerXAnchor),
//            headerLabel.topAnchor.constraint(equalTo: table.topAnchor),
//        ])
//
//        header.addSubview(headerLabel)
//        table.tableHeaderView = header //
//    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: TestTableViewCell.cellID, for: indexPath) as! TestTableViewCell
        
        cell.nameLabel.text = sect[indexPath.row].name
        cell.nameLabel.textColor = .white
        cell.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        return cell
    }
    
    // section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "This is section Header"
    }

    
}
