//
//  LoginInstance.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 07/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

struct LoginInstance {

    static func resolveViewController() -> LoginViewController {
        let loginPresenter = resolvePresenter()
        let loginViewController = LoginViewController(presenter: loginPresenter)
        loginPresenter.delegate = loginViewController

        return loginViewController
    }

    private static func resolvePresenter() -> LoginPresenter {
        return LoginPresenter()
    }

}
