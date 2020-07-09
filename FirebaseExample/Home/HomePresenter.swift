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

    func logOutButtonTapped(_ provider: ProviderType) {
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                delegate?.goBack()
            } catch {
                print("Ocurrió un error.")
            }
        }
    }

}
