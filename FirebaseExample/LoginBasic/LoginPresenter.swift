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

    func logInButtonTapped(email: String?, password: String?) {
        guard let email = email, let password = password else { return }

        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let result = result, error == nil else {
                self.delegate?.showAlert()
                return
            }

            self.delegate?.goToHome(email: result.user.email ?? "")
        }
    }

}
