//
//  LoginPresenter.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 07/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import FirebaseAuth

class LoginPresenter {

    weak var delegate: LoginProtocol?

    func signUpButtonTapped(email: String?, password: String?) {
        guard let email = email, let password = password else { return }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            self?.onComplete(result, error)
        }
    }

    func logInButtonTapped(email: String?, password: String?) {
        guard let email = email, let password = password else { return }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            self?.onComplete(result, error)
        }
    }

    private func onComplete(_ result: AuthDataResult?, _ error: Error?) {
        if let result = result, error == nil {
            onSuccess(result)
            return
        }

        onError()
    }

    private func onSuccess(_ result: AuthDataResult) {
        delegate?.goToHome(email: result.user.email ?? "")
    }

    private func onError() {
        delegate?.showAlert()
    }

}