//
//  NiftiScanViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/15.
//

import UIKit
import AVFoundation

class NiftiScanViewController: UIViewController {
    
//MARK: QR Related
    let qrReaderView: QrReaderView = {
        let readerView = QrReaderView(frame: CGRect(x: 0, y: 0, width: 314, height: 314))
        
//        readerView.backgroundColor = .white
        readerView.layer.masksToBounds = true
        readerView.layer.cornerRadius = 15
        
        return readerView
    }()
    
    let readButton: UIButton = {
        let read = UIButton()
        
        read.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        read.backgroundColor = UIColor.blue
        read.setTitle("Scan", for: .normal)
        read.setTitle(("Stop"), for: .selected)
        read.addTarget(self, action: #selector(scanButtonAction(_:)), for: .touchUpInside)
        read.layer.masksToBounds = true
        read.layer.cornerRadius = 15
        
        return read
    }()
    
//MARK: Authentication Related
    let auth = FaceIDAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setAuth()
        addViews()
        setAutoLayouts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if !self.qrReaderView.isRunning {
            self.qrReaderView.stop(isButtonTap: false)
        }
    }
    
    @objc func scanButtonAction(_ sender: UIButton) {
        if self.qrReaderView.isRunning {
            self.qrReaderView.stop(isButtonTap: true)
        } else {
            self.qrReaderView.start()
        }

        sender.isSelected = self.qrReaderView.isRunning
    }
    
    func setView() {
        self.view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func setAuth() {
        auth.delegate = self
    }
    
    func addViews() {
        self.view.addSubview(qrReaderView)
        self.qrReaderView.delegate = self
        self.view.addSubview(readButton)
    }
    
    func setAutoLayouts() {
        qrReaderViewAutoLayout()
        readButtonAutoLayout()
    }
}

extension NiftiScanViewController: QrReaderViewDelegate {
    func qrReaderComplete(status: QrReaderStatus) {
        var title = ""
        var message = ""
        switch status {
        case let .success(code):
            guard let code = code else {
                title = "Error"
                message = "QR Code not found.\nPlease try again."
                break
            }
            title = "Identification Request"
//            message = "Success!\n\(code)"
            message = "Are you sure to\nidentify \(code)?"
        case .fail:
            title = "Error"
            message = "QR Code not found.\nPlease try again."
        case let .stop(isButtonTap):
            if isButtonTap {
                title = "Notice"
                message = "Scanning stopped."
                self.readButton.isSelected = qrReaderView.isRunning
            } else {
                self.readButton.isSelected = qrReaderView.isRunning
                return
            }
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { action in
            //여기다
            //self.showSuccessAlertView()
            self.auth.execute()
        })
        let noAction = UIAlertAction(title: "No", style: .destructive, handler: nil)

        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension NiftiScanViewController: AuthenticateStateDelegate {
    func didUpdateState(_ state: FaceIDAuth.AuthenticationState) {
        if case .loggedIn = state {
            showSuccessAlertView()
        }
    }
    
    func showSuccessAlertView() {
        let successAlert = UIAlertController(title: "Success", message: "Successfully Identified", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
        
        successAlert.addAction(okAction)
        self.present(successAlert, animated: true, completion: nil)
    }
}

extension NiftiScanViewController {
    func qrReaderViewAutoLayout() {
        qrReaderView.translatesAutoresizingMaskIntoConstraints = false
        qrReaderView.heightAnchor.constraint(equalToConstant: 314).isActive = true
        qrReaderView.widthAnchor.constraint(equalToConstant: 314).isActive = true
        qrReaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        qrReaderView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -10).isActive = true
    }
    func readButtonAutoLayout() {
        readButton.translatesAutoresizingMaskIntoConstraints = false
        readButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        readButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        readButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        readButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20).isActive = true
    }
}
