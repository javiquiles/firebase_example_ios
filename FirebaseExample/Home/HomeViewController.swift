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

    private let email: String
    private let provider: ProviderType

    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: "HomeViewController", bundle: Bundle.main)
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
    }

}
