//
//  StartViewController.swift
//  Nifti
//
//  Created by BoMin on 2022/08/07.
//

import UIKit
import AuthenticationServices

class StartViewController: UIViewController {
    
//MARK: Label
    let test: UILabel = {
        let testLabel = UILabel()
        testLabel.text = "TEXT"
        testLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        testLabel.font = .boldSystemFont(ofSize: 45)
        
        return testLabel
    }()
    
//MARK: View
    let niftiImageView: UIImageView = {
        let niftiImage = UIImageView()
        //niftiImage.backgroundColor = .blue
        let niftiLogo: UIImage = UIImage(named: "NIFTI_White.png")!
        niftiImage.image = niftiLogo
        
        
        return niftiImage
    }()
    
    let signUpView: UIView = {
        let signUp = UIView()
        //signUp.backgroundColor = .red
        return signUp
    }()
    
//MARK: Button
    let appleLoginButton: ASAuthorizationAppleIDButton = {
        let appleLoginBtn = ASAuthorizationAppleIDButton(type: .signUp, style: .white)
        appleLoginBtn.addTarget(self, action: #selector(handleAppleLoginButton), for: .touchUpInside)
        
        return appleLoginBtn
    }()
    
//MARK: viewDidLoad
    override func viewDidLoad() {
        setView()
        setAutoLayouts()
    }
    
//MARK: View Settings, AutoLayouts
    func setView() {
        view.backgroundColor = UIColor(red: 0.121, green: 0.121, blue: 0.121, alpha: 1)
    }
    
    func setAutoLayouts() {
        // addSubViews
        //self.view.addSubview(test)
        self.view.addSubview(niftiImageView)
        self.view.addSubview(signUpView)
        self.signUpView.addSubview(appleLoginButton)
        
        // components' auto layouts
        //testAutoLayout()
        niftiImageAutoLayout()
        signUpViewAutoLayout()
        appleLoginAutoLayout()
    }


}

//MARK: EXTENSION: Apple Login settings
extension StartViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return self.view.window!
        }
}

//MARK: EXTENSION: AutoLayouts
extension StartViewController {
//    func testAutoLayout() {
//        test.translatesAutoresizingMaskIntoConstraints = false
//        test.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        test.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//    }
    func niftiImageAutoLayout() {
        niftiImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // set contentMode
        niftiImageView.contentMode = .scaleAspectFit
        
        // set width & height anchors
        niftiImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        niftiImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // set other anchors
        niftiImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        niftiImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30).isActive = true
        //niftiImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    }
    func signUpViewAutoLayout() {
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        signUpView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        signUpView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // set other anchors
        signUpView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //signUpView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        signUpView.topAnchor.constraint(equalTo: self.niftiImageView.bottomAnchor).isActive = true
        
    }
    func appleLoginAutoLayout() {
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // set width & height anchors
        appleLoginButton.widthAnchor.constraint(equalToConstant: 210).isActive = true
        appleLoginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        // set other anchors
        appleLoginButton.centerXAnchor.constraint(equalTo: self.signUpView.centerXAnchor).isActive = true
        appleLoginButton.centerYAnchor.constraint(equalTo: self.signUpView.centerYAnchor).isActive = true
    }
}

//MARK: EXTENSION: handle functions
extension StartViewController {
    @objc func handleAppleLoginButton() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let req = appleIDProvider.createRequest()
        req.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [req])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}
