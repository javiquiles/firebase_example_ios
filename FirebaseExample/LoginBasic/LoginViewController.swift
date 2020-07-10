//
//  LoginViewController.swift
//  FirebaseAuthentication
//
//  Created by Javier Quiles on 04/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    
    private let presenter: LoginPresenter

    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: LoginViewController.self), bundle: Bundle.main)
        self.presenter.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //googleButton.imageView?.contentMode = .scaleAspectFit
    }

    @IBAction func logInButtonAction(_ sender: Any) {
        presenter.logInButtonTapped(email: emailTextField.text, password: passwordTextField.text)
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        presenter.signUpButtonTapped(email: emailTextField.text, password: passwordTextField.text)
    }

    @IBAction func googleButtonAction(_ sender: Any) {
    }
}

extension LoginViewController: LoginProtocol {

    func goToHome(email: String) {
        navigationController?.pushViewController(HomeViewController(email: email, provider: .basic), animated: true)
    }
    
    func showAlert(_ error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alertController, animated: true, completion: nil)
    }

}
