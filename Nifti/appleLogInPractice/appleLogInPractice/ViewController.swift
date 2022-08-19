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
    
//    var appleLoginButton: ASAuthorizationAppleIDButton {
//        let appleButton = ASAuthorizationAppleIDButton(type: .signUp, style: .whiteOutline)
//        appleButton.addTarget(self, action: #selector(handleAppleButtonPress), for: .touchUpInside)
//        return appleButton
//    }
    
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
        if #available(iOS 13.0, *) {
//            self.testView.addSubview(appleButton)
            
//            setAppleLoginAutoLayout()
            
            let appleButton = ASAuthorizationAppleIDButton(type: .signUp, style: .whiteOutline)
            appleButton.addTarget(self, action: #selector(handleAppleButtonPress), for: .touchUpInside)
            
            
            appleButton.translatesAutoresizingMaskIntoConstraints = false
            
            appleButton.centerXAnchor.constraint(equalTo: self.testView.centerXAnchor).isActive = true
            appleButton.centerYAnchor.constraint(equalTo: self.testView.centerYAnchor).isActive = true
            appleButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
            appleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            self.testView.addSubview(appleButton)

            
        }
    }
    
//    func setAppleLoginAutoLayout() {
//        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            appleLoginButton.centerXAnchor.constraint(equalTo: self.testView.centerXAnchor),
//            appleLoginButton.centerYAnchor.constraint(equalTo: self.testView.centerYAnchor),
//            appleLoginButton.widthAnchor.constraint(equalToConstant: 280),
//            appleLoginButton.heightAnchor.constraint(equalToConstant: 60),
//        ])
//    }
    
    @objc func handleAppleButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let req = appleIDProvider.createRequest()
        req.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [req])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            if  let authorizationCode = appleIDCredential.authorizationCode,
                let identityToken = appleIDCredential.identityToken,
                let authString = String(data: authorizationCode, encoding: .utf8),
                let tokenString = String(data: identityToken, encoding: .utf8) {
                print("authorizationCode: \(authorizationCode)")
                print("identityToken: \(identityToken)")
                print("authString: \(authString)")
                print("tokenString: \(tokenString)")
            }
            
            print("useridentifier: \(userIdentifier)")
            print("fullName: \(fullName)")
            print("email: \(email)")
            
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            print("username: \(username)")
            print("password: \(password)")
            
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("login error")
    }
    

}


//final class AppleLoginManager: NSObject {
//    weak var viewController: UIViewController?
//    weak var delegate: AppleLoginManagerDelegate?
//
//    func setAppleLoginPresentationAnchorView(_ view: UIViewController) {
//        self.viewController = view
//    }
//}


extension ViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    @available(iOS 13.0, *)
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
