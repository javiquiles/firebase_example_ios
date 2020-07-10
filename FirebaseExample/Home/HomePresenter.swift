//
//  HomePresenter.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 09/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import FirebaseAuth

class HomePresenter {

    weak var delegate: HomeProtocol?

    func viewDidLoad(_ email: String, _ provider: ProviderType) {
        saveUserData(email, provider)
    }

    func logOutButtonTapped(_ provider: ProviderType) {
        removeUserData()

        switch provider {
        case .basic, .google:
            do {
                try Auth.auth().signOut()
                delegate?.goBack()
            } catch {
                print("Ocurrió un error.")
            }
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
