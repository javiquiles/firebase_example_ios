//
//  LoginProtocol.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 07/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

protocol LoginProtocol: class {
    func goToHome(email: String)
    func showAlert(_ error: String)
}
