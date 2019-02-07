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
		window?.rootViewController = createInitialViewController()
		window?.makeKeyAndVisible()

		return true
	}

	// MARK: - Private methods -

	func createInitialViewController() -> UIViewController {

		let agentAuthenticationViewController = AgentAuthenticationViewController()
		let navigationController = UINavigationController(rootViewController: agentAuthenticationViewController)


		navigationController.navigationBar.prefersLargeTitles = true

		return navigationController
	}
}

