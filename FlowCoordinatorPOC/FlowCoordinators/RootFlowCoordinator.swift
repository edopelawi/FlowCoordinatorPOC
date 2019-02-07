//
//  RootFlowCoordinator.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class RootFlowCoordinator {

	private var navigationController: UINavigationController? {
		didSet {
			authenticationCoordinator.navigationController = navigationController
			missionCoordinator.navigationController = navigationController
		}
	}

	private let authenticationCoordinator = AuthenticationFlowCoordinator()
	private let missionCoordinator = MissionFlowCoordinator()

	// MARK: - Public methods -

	init() {
		configureAuthenticationCoordinator()
	}


	func createRootViewController() -> UIViewController {

		let initialViewController = authenticationCoordinator.createInitialViewController()
		let navigationController = UINavigationController(rootViewController: initialViewController)

		navigationController.navigationBar.prefersLargeTitles = true

		self.navigationController = navigationController

		return navigationController
	}

	// MARK: - Private methods


	private func configureAuthenticationCoordinator() {

		authenticationCoordinator.onNavigationEvent = { [weak self] (event: AuthenticationFlowCoordinator.NavigationEvent) -> Void in

			self?.missionCoordinator.setInitialViewController()
		}
	}

	private func getShownMissionListViewController() -> MissionListViewController? {

		guard let viewControllerStack = self.navigationController?.viewControllers else {
			return nil
		}

		for viewController in viewControllerStack {

			if let missionListViewController = viewController as? MissionListViewController {
				return missionListViewController
			}
		}

		return nil
	}
}
