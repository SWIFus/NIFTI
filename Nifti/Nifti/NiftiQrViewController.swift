//
//  NiftiQrViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/09.
//

import UIKit
import QRCode

let serviceButtonSet = [
    UIImage(named: "service1-chat"),
    UIImage(named: "service2-sns"),
    UIImage(named: "service3-shop"),
    UIImage(named: "service4-crypto"),
    UIImage(named: "service5-bank"),
    UIImage(named: "service6-security"),
    UIImage(named: "service7-community"),
]

let serviceNameSet = [
    "Nifti Chat",
    "Nifti SNS",
    "Nifti Shop",
    "Nifti Coin",
    "Nifti Bank",
    "Nifti Secure",
    "Nifti United",
]

class NiftiQrViewController: UIViewController {
    
//MARK: Label
    let usernameLabel: UILabel = {
        let username = UILabel()
        
//        username.frame = CGRect(x: 0, y: 0, width: 137, height: 20)
        username.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        username.font = .boldSystemFont(ofSize: 25)
        username.numberOfLines = 2
        
        username.text = "Hello, \(StartViewController.PostValues.nameValue) !\nWelcome to NIFTI"
        username.textAlignment = .center
        
        return username
    }()
    
    let commingSoonLabel: UILabel = {
        let commingSoon = UILabel()
        
//        commingSoon.backgroundColor = .red
        commingSoon.textColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 0.8)
        commingSoon.font = .boldSystemFont(ofSize: 20)
        commingSoon.numberOfLines = 3
        
        commingSoon.text = "🌐 Nifti SNS\n\n💬 Nifti Chat"
        commingSoon.textAlignment = .center
        
        return commingSoon
    }()
    
    let serviceLabel: UILabel = {
        let service = UILabel()
        
        service.textColor = .black
        service.font = .boldSystemFont(ofSize: 23)
        service.numberOfLines = 1
        service.text = "Services In Use"
        service.textAlignment = .left
        service.textColor = .white
        
        service.translatesAutoresizingMaskIntoConstraints = false
        
        return service
    }()
    
//MARK: View
    let qrView: UIView = {
        let qr = UIView()
        
        qr.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        qr.backgroundColor = .white
        qr.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1).cgColor
        qr.layer.cornerRadius = 40
        qr.translatesAutoresizingMaskIntoConstraints = false
        
        return qr
    }()
    
    let connectToApps: UIView = {
        let connect = UIView()
        
        connect.frame = CGRect(x: 0, y: 0, width: 320, height: 250)
        connect.backgroundColor = .white
//        connect.layer.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.72, alpha: 1).cgColor
        connect.layer.backgroundColor = UIColor.clear.cgColor
        connect.layer.cornerRadius = 40
        connect.clipsToBounds = true
        
        return connect
    }()
    
//MARK: ImageView
    let qrImageView: UIImageView = {
        let qrImgView = UIImageView()
        
        qrImgView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        qrImgView.backgroundColor = .blue
        //qrImgView.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        let qrImg: UIImage = UIImage(named: )!
//        qrImgView.image = qrImg
        
        return qrImgView
    }()
    
    let qrCodeImageView: UIImageView = {
        var qrCode = QRCode(string: "Nifti")
        
        qrCode!.color = .black

        qrCode!.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1)
        qrCode!.size = CGSize(width: 150, height: 150)
        qrCode!.scale = 1.0
        qrCode!.inputCorrection = .quartile
        
        let qrCodeImg = UIImageView.init(qrCode: qrCode! as QRCode)
        
        return qrCodeImg
        
    }()

//MARK: CollectionView
    
    let serviceFlowLayout: ServiceCollectionViewFlowLayout = {
        let layout = ServiceCollectionViewFlowLayout()
        layout.cellSpacing = 10
        layout.numOfColumns = 1
        return layout
    }()
    
    var dataSource = getServiceButtons()
    var dataSourceLabel = getServiceLabels()
    
    lazy var serviceCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.serviceFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = true
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
        view.backgroundColor = .clear
//        view.backgroundColor = .systemRed
        view.clipsToBounds = true
        view.register(ServiceCell.self, forCellWithReuseIdentifier: ServiceCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAutoLayouts()

    }
    
//MARK: View Settings, AutoLayouts
    func setView() {
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func setAutoLayouts() {
        self.view.addSubview(qrView)
        //self.view.addSubview(qrImageView)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(qrCodeImageView)
        self.view.addSubview(connectToApps)
//        self.connectToApps.addSubview(commingSoonLabel)
        self.connectToApps.addSubview(self.serviceCollectionView)
        self.connectToApps.addSubview(self.serviceLabel)
        
        qrViewAutoLayout()
        //qrImageViewAutoLayout()
        usernameLabelAutoLayout()
        qrCodeImageViewAutoLayout()
        connectToAppsAutoLayout()
//        commingSoonLabelAutoLayout()
        serviceCollectionViewAutoLayout()
        serviceLabelAutoLayout()
        
        self.serviceCollectionView.dataSource = self
        self.serviceCollectionView.delegate = self
    }
}

//MARK: EXTENSION: AutoLayouts
extension NiftiQrViewController {
    func qrViewAutoLayout() {
        let qrViewConstraints = [
            // set width & height anchors
            qrView.widthAnchor.constraint(equalToConstant: 200),
            qrView.heightAnchor.constraint(equalTo: qrView.widthAnchor),
            
            // set other anchors
            qrView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            qrView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128)
        ]
        NSLayoutConstraint.activate(qrViewConstraints)
    }
    
    func qrImageViewAutoLayout() {
        qrImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let qrImageViewConstraints = [
            // set width & height anchors
            qrImageView.widthAnchor.constraint(equalToConstant: 120),
            qrImageView.heightAnchor.constraint(equalToConstant: 120),
            
            // set other anchors
            qrImageView.centerXAnchor.constraint(equalTo: self.qrView.centerXAnchor),
            qrImageView.centerYAnchor.constraint(equalTo: self.qrView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(qrImageViewConstraints)
        
    }
    
    func usernameLabelAutoLayout() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        usernameLabel.leadingAnchor.constraint(equalTo: self.connectToApps.leadingAnchor).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: self.connectToApps.trailingAnchor).isActive = true
        
        // set other anchors
        usernameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: self.qrView.bottomAnchor, constant: 20).isActive = true
//        usernameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func qrCodeImageViewAutoLayout() {
        qrCodeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        qrCodeImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        qrCodeImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // set other anchors
        qrCodeImageView.centerXAnchor.constraint(equalTo: self.qrView.centerXAnchor).isActive = true
        qrCodeImageView.centerYAnchor.constraint(equalTo: self.qrView.centerYAnchor).isActive = true
    }
    
    func connectToAppsAutoLayout() {
        connectToApps.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        connectToApps.widthAnchor.constraint(equalToConstant: self.view.frame.size.width * 0.9).isActive = true
        connectToApps.heightAnchor.constraint(equalToConstant: self.view.frame.size.height * 0.25).isActive = true
        
        // set other anchors
        connectToApps.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        connectToApps.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.size.height * 0.25).isActive = true
//        connectToApps.topAnchor.
    }
    
    func commingSoonLabelAutoLayout() {
        commingSoonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let commingSoonLabelConstraints = [
            // set width & height anchors
            commingSoonLabel.widthAnchor.constraint(equalToConstant: self.connectToApps.frame.size.width),
            commingSoonLabel.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height),
            
            // set other anchors
            commingSoonLabel.centerXAnchor.constraint(equalTo: self.connectToApps.centerXAnchor),
            commingSoonLabel.centerYAnchor.constraint(equalTo: self.connectToApps.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(commingSoonLabelConstraints)
    }
    
    func serviceCollectionViewAutoLayout() {
        NSLayoutConstraint.activate([
            self.serviceCollectionView.leadingAnchor.constraint(equalTo: self.connectToApps.leadingAnchor, constant: 10),
            self.serviceCollectionView.trailingAnchor.constraint(equalTo: self.connectToApps.trailingAnchor, constant: -10),
            self.serviceCollectionView.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height*0.3),
            self.serviceCollectionView.bottomAnchor.constraint(equalTo: self.connectToApps.bottomAnchor, constant: -(self.connectToApps.frame.size.height)*0.2),
        ])
    }
    
    func serviceLabelAutoLayout() {
        NSLayoutConstraint.activate([
            self.serviceLabel.leadingAnchor.constraint(equalTo: self.connectToApps.leadingAnchor, constant: 10),
            self.serviceLabel.trailingAnchor.constraint(equalTo: self.connectToApps.trailingAnchor, constant: -10),
            self.serviceLabel.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height*0.2),
            self.serviceLabel.topAnchor.constraint(equalTo: self.connectToApps.topAnchor, constant: (self.connectToApps.frame.size.height)*0.1),
        ])
    }
}

extension NiftiQrViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = serviceCollectionView.dequeueReusableCell(withReuseIdentifier: ServiceCell.identifier, for: indexPath) as! ServiceCell
        cell.prepare(image: self.dataSource[indexPath.item], label: self.dataSourceLabel[indexPath.item])
        return cell
    }
}

extension NiftiQrViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? ServiceCollectionViewFlowLayout, flowLayout.numOfColumns > 0 else { fatalError() }
        let widthOfCells = collectionView.bounds.height
        let widthOfSpacing = CGFloat(flowLayout.numOfColumns - 1) * flowLayout.cellSpacing
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numOfColumns)
        
        return CGSize(width: width, height: width * flowLayout.ratioHeighttoWidth)
    }
}

func getServiceButtons() -> [UIImage?] {
    serviceButtonSet
}

func getServiceLabels() -> [String?] {
    serviceNameSet
}
