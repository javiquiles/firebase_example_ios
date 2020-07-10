//
//  LoginPresenter.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 07/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import FirebaseAuth
import GoogleSignIn

class LoginPresenter {

    weak var delegate: LoginProtocol?

    func viewDidLoad() {
        if let email = UserDefaults.standard.value(forKey: "email") as? String,
            let provider = ProviderType(rawValue: UserDefaults.standard.value(forKey: "provider") as? String ?? "") {
            delegate?.goToHome(email: email, provider: provider, animated: false)
        }
    }

    func signUpButtonTapped(email: String?, password: String?) {
        guard let email = email, let password = password else { return }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            self?.onComplete(result, error, provider: .basic)
        }
    }

    func logInButtonTapped(email: String?, password: String?) {
        guard let email = email, let password = password else { return }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            self?.onComplete(result, error, provider: .basic)
        }
    }

    func didSignInGoogle(user: GIDGoogleUser, error: Error) {
        guard let authentication = user.authentication  else {
            onError(error.localizedDescription, provider: .google)
            return
        }

        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)

        Auth.auth().signIn(with: credential) { [weak self] (result, error) in
            self?.onComplete(result, error, provider: .google)
        }
    }

    private func onComplete(_ result: AuthDataResult?, _ error: Error?, provider: ProviderType) {
        if let result = result, error == nil {
            onSuccess(result, provider)
            return
        }

        onError(error?.localizedDescription ?? "", provider: provider)
    }

    private func onSuccess(_ result: AuthDataResult, _ provider: ProviderType) {
        delegate?.goToHome(email: result.user.email ?? "", provider: provider, animated: true)
    }

    private func onError(_ error: String, provider: ProviderType) {
        delegate?.showAlert(error, provider.rawValue)
    }

}
