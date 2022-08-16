//
//  ViewController.swift
//  appleLogInPractice
//
//  Created by BoMin on 2022/08/09.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {

    let testView: UIView = {
        let test = UIView()
        test.backgroundColor = .white
        return test
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        setAutoLayouts()
        setUpProviderLogInView()
    }
    
    func setAutoLayouts() {
        self.view.addSubview(testView)
        
        testViewAutoLayout()
    }

    func setUpProviderLogInView() {
        let appleButton = ASAuthorizationAppleIDButton(type: .signUp, style: .whiteOutline)
        appleButton.addTarget(self, action: "handleAppleButtonPress", for: .touchUpInside)
        self.testView.addSubview(appleButton)
        
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.centerXAnchor.constraint(equalTo: self.testView.centerXAnchor).isActive = true
        appleButton.centerYAnchor.constraint(equalTo: self.testView.centerYAnchor).isActive = true
        appleButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
        appleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    func handleAppleButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let req = appleIDProvider.createRequest()
        req.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [req])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

}

extension ViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return self.view.window!
        }
}

extension ViewController {

    func testViewAutoLayout() {
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        testView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        testView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
