//
//  FaceIDAuth.swift
//  Nifti
//
//  Created by BoMin on 2022/09/20.
//

import LocalAuthentication

public protocol AuthenticateStateDelegate: AnyObject { //상태 표출
    func didUpdateState(_ state: FaceIDAuth.AuthenticationState)
}

public class FaceIDAuth {
    public enum AuthenticationState {
        case loggedIn
        case loggedOut
    }
    
    public weak var delegate: AuthenticateStateDelegate?
    private var context = LAContext()
    
    init() {
        configure()
    }
    
    private func configure() { //인증 실패시
        context.localizedCancelTitle = "Enter Password"
    }
    
    public func execute() {
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { [weak self] isSuccess, error in
                if isSuccess {
                    DispatchQueue.main.sync { [weak self] in
                        self?.delegate?.didUpdateState(.loggedIn)
                    }
                } else {
                    print(error?.localizedDescription ?? "Failed to Authenticate")
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
        }
    }
}
