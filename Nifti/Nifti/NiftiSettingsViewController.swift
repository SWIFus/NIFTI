//
//  NiftiSettingsViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/17.
//

import UIKit

class NiftiSettingsViewController: UIViewController {

    let table = UITableView()
    
    let tableHeaderView = SettingsHeaderView()
    
    let testArray = ["a", "b", "c", "d", "e", "a", "b", "c", "d", "e"]
    let testArray2 = ["1", "2", "3", "4", "5", "6", "7"]
    
//    struct Sect {
//        let name: String
//    }
//
//
//    let sect: [Sect] = [Sect(name: "안녕"),
//                        Sect(name: "하세요"),
//                        Sect(name: "저는"),
//                        Sect(name: "동물의숲을합니다") ]
//
//    let sect2: [Sect] = [Sect(name: "안녕"),
//                         Sect(name: "하세요"),
//                         Sect(name: "저는"),
//                         Sect(name: "포켓몬을합니다") ]
    
    class Sect {
        init(items: [String], header: String? = nil) {
            self.items = items
            self.header = header
        }
        
        let items: [String]
        let header: String?
    }

    
    let sect: [Sect] = [
        Sect(items: ["비밀번호 설정", "비공개 설정", "고객 센터"], header: "보안"),
        Sect(items: ["Repair Code", "로그아웃", "계정 탈퇴"], header: "계정"),
        Sect(items: ["개인 정보 보호 관련 안내"], header: "계정"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
    }
    
    func attribute() {
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.cellID)
        table.register(SettingsSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
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

extension NiftiSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
}



extension NiftiSettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sect[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: SettingsTableViewCell.cellID, for: indexPath) as! SettingsTableViewCell
        
//        cell.nameLabel.text = sect[indexPath.row].name
        cell.nameLabel.text = sect[indexPath.section].items[indexPath.row] //
        cell.nameLabel.textColor = .white
        cell.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sect.count
    }
    
    // section header
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sect[section].header
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! SettingsSectionHeaderView
//        view.title.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        view.title.text = sect[section].header
        view.title.textColor = .systemGray
        view.title.font = .boldSystemFont(ofSize: 20)
        
        return view
    }

    
}
