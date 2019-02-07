//
//  AppDelegate.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let frame = UIScreen.main.bounds
		window = UIWindow(frame: frame)
		window?.rootViewController = createRootViewController()
		window?.makeKeyAndVisible()

		return true
	}

	// MARK: - Private methods -

	func createRootViewController() -> UIViewController {

		let initialViewController = createInitialViewController()
		let navigationController = UINavigationController(rootViewController: initialViewController)

		navigationController.navigationBar.prefersLargeTitles = true

		return navigationController
	}

	func createInitialViewController() -> UIViewController {

		// TODO: Move this to FlowCoordinator later.

		if let _ = AgentStorage.shared.getStoredAgent() {
			return PINInputViewController()
		} else {
			return AgentAuthenticationViewController()
		}
	}
	
}

