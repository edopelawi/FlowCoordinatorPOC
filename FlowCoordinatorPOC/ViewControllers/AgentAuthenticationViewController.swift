//
//  AgentAuthenticationViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class AgentAuthenticationViewController: UIViewController {

	@IBOutlet weak var inputTextField: UITextField!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.isNavigationBarHidden = true
		navigationItem.largeTitleDisplayMode = .never
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		inputTextField.becomeFirstResponder()
	}

	@IBAction func authenticateAgent(_ sender: Any) {

		let pinInputViewController = PINInputViewController()
		self.navigationController?.pushViewController(pinInputViewController, animated: true)
	}
}
