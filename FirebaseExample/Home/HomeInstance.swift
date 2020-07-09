//
//  HomeInstance.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 09/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

struct HomeInstance {

    static func resolveViewController() -> HomeViewController {
        let presenter = resolvePresenter()
        let viewController = HomeViewController(presenter: presenter)
        presenter.delegate = viewController

        return viewController
    }

    static func resolvePresenter() -> HomePresenter {
        return HomePresenter()
    }

}
