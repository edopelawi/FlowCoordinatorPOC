//
//  RootFlowCoordinator.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class RootFlowCoordinator {

	private var navigationController: UINavigationController?

	// MARK: - Public methods -

	func createRootViewController() -> UIViewController {

		let initialViewController = createInitialViewController()
		let navigationController = UINavigationController(rootViewController: initialViewController)

		navigationController.navigationBar.prefersLargeTitles = true

		self.navigationController = navigationController

		return navigationController
	}

	// MARK: - Private methods

	private func createInitialViewController() -> UIViewController {

		if let currentAgent = AgentStorage.shared.getStoredAgent() {

			let pinViewModel = ReturningAgentPINInputViewModel(agent: currentAgent)
			return PINInputViewController(viewModel: pinViewModel)
		} else {
			return AgentAuthenticationViewController()
		}
	}

}
