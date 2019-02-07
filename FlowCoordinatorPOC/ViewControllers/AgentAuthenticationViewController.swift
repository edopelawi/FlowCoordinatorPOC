//
//  AgentAuthenticationViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class AgentAuthenticationViewController: UIViewController {

	enum NavigationEvent {
		case finished(agentName: String)
	}

	var onNavigationEvent: ((NavigationEvent) -> Void)?

	@IBOutlet private weak var inputTextField: UITextField!


	convenience init(onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {
		self.init()
		self.onNavigationEvent = onNavigationEvent
	}
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

		guard let agentName = inputTextField.text else {
			return
		}

		self.onNavigationEvent?(.finished(agentName: agentName))
	}
}
