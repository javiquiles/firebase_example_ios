//
//  HomeViewController.swift
//  FirebaseExample
//
//  Created by Javier Quiles on 06/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit

enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!

    private let presenter: HomePresenter
    private var email: String = ""
    private var provider: ProviderType = .basic

    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
        self.presenter.delegate = self
    }

    convenience init(email: String, provider: ProviderType) {
        self.init(presenter: HomeInstance.resolvePresenter())
        self.email = email
        self.provider = provider
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }

    @IBAction func logOutButtonAction(_ sender: Any) {
        presenter.logOutButtonTapped(provider)
    }

}

extension HomeViewController: HomeProtocol {

    func goBack() {
        navigationController?.popViewController(animated: true)
    }

}
