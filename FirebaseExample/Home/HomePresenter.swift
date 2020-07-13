//
//  HomePresenter.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 09/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class HomePresenter {

    weak var delegate: HomeProtocol?

    func viewDidLoad(_ email: String, _ provider: ProviderType) {
        saveUserData(email, provider)
    }

    func logOutButtonTapped(_ provider: ProviderType) {
        removeUserData()

        switch provider {
        case .basic:
            firebaseLogOut()
        case .google:
            GIDSignIn.sharedInstance()?.signOut()
            firebaseLogOut()
        case .facebook:
            LoginManager().logOut()
            firebaseLogOut()
        }
    }

    private func firebaseLogOut() {
        do {
            try Auth.auth().signOut()
            delegate?.goBack()
        } catch {
            print("Ocurrió un error.")
        }
    }

    private func saveUserData(_ email: String, _ provider: ProviderType) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(provider.rawValue, forKey: "provider")
        UserDefaults.standard.synchronize()
    }

    private func removeUserData() {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "provider")
        UserDefaults.standard.synchronize()
    }

}
