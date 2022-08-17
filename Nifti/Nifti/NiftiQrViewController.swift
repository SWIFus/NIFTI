//
//  NiftiQrViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/09.
//

import UIKit
import QRCode

class NiftiQrViewController: UIViewController {
    
//MARK: Label
    let usernameLabel: UILabel = {
        let username = UILabel()
        
        username.frame = CGRect(x: 0, y: 0, width: 137, height: 20)
        username.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        username.font = .systemFont(ofSize: 20)
        
        username.text = "USER_NIFTI"
        username.textAlignment = .center
        
        return username
    }()
    
    let commingSoonLabel: UILabel = {
        let commingSoon = UILabel()
        
//        commingSoon.backgroundColor = .red
        commingSoon.textColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
        commingSoon.font = .systemFont(ofSize: 15)
        
        commingSoon.text = "Comming Soon"
        commingSoon.textAlignment = .center
        
        return commingSoon
    }()
    
//MARK: View
    let qrView: UIView = {
        let qr = UIView()
        
        qr.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        qr.backgroundColor = .white
        qr.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1).cgColor
        qr.layer.cornerRadius = 40
        
        return qr
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
        var qrCode = QRCode(string: "www.google.com")
        
        qrCode!.color = .black

        qrCode!.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1)
        qrCode!.size = CGSize(width: 150, height: 150)
        qrCode!.scale = 1.0
        qrCode!.inputCorrection = .quartile
        
        let qrCodeImg = UIImageView.init(qrCode: qrCode! as QRCode)
        
        return qrCodeImg
        
    }()
    
    let connectToApps: UIView = {
        let connect = UIView()
        
        connect.frame = CGRect(x: 0, y: 0, width: 320, height: 280)
        connect.backgroundColor = .white
        connect.layer.backgroundColor = UIColor(red: 0.882, green: 0.863, blue: 0.851, alpha: 1).cgColor
        connect.layer.cornerRadius = 40
        
        return connect
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
        self.connectToApps.addSubview(commingSoonLabel)
        
        qrViewAutoLayout()
        //qrImageViewAutoLayout()
        usernameLabelAutoLayout()
        qrCodeImageViewAutoLayout()
        connectToAppsAutoLayout()
        commingSoonLabelAutoLayout()
        
    }
}

//MARK: EXTENSION: AutoLayouts
extension NiftiQrViewController {
    func qrViewAutoLayout() {
        qrView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        // set width & height anchors
        qrImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        qrImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        // set other anchors
        qrImageView.centerXAnchor.constraint(equalTo: self.qrView.centerXAnchor).isActive = true
        qrImageView.centerYAnchor.constraint(equalTo: self.qrView.centerYAnchor).isActive = true
    }
    
    func usernameLabelAutoLayout() {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        usernameLabel.widthAnchor.constraint(equalToConstant: 137).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
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
        connectToApps.widthAnchor.constraint(equalToConstant: self.view.frame.size.width * 0.8).isActive = true
        connectToApps.heightAnchor.constraint(equalToConstant: self.view.frame.size.height * 0.3).isActive = true
        
        // set other anchors
        connectToApps.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        connectToApps.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.size.height * 0.2).isActive = true
//        connectToApps.topAnchor.
    }
    
    func commingSoonLabelAutoLayout() {
        commingSoonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let commingSoonLabelConstraints = [
            // set width & height anchors
            commingSoonLabel.widthAnchor.constraint(equalToConstant: self.connectToApps.frame.size.width * 0.8),
            commingSoonLabel.heightAnchor.constraint(equalToConstant: self.connectToApps.frame.size.height * 0.2),
            
            // set other anchors
            commingSoonLabel.centerXAnchor.constraint(equalTo: self.connectToApps.centerXAnchor),
            commingSoonLabel.centerYAnchor.constraint(equalTo: self.connectToApps.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(commingSoonLabelConstraints)
    }
    
}
