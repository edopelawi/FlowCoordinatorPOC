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
			return createReturningAgentPINInputViewController(agent: currentAgent)
		} else {
			return createAgentAuthenticationViewController()
		}
	}

	private func createAgentAuthenticationViewController() -> AgentAuthenticationViewController {

		return AgentAuthenticationViewController(onNavigationEvent: { [weak self] (event: AgentAuthenticationViewController.NavigationEvent) in

			guard let self = self,
				case .finished(let agentName) = event else {
				return
			}

			let pinInputViewController = self.createNewAgentPINInputViewController(agentName: agentName)
			self.navigationController?.pushViewController(pinInputViewController, animated: true)
		})
	}

	private func createNewAgentPINInputViewController(agentName: String) -> PINInputViewController {

		let pinViewModel = NewAgentPINInputViewModel(agentName: agentName)
		return createPINInputViewController(viewModel: pinViewModel) { [weak self] in

			guard let self = self else {
				return
			}

			let missionListViewController = self.createMissionListViewController()
			self.navigationController?.setViewControllers([missionListViewController], animated: true)
		}
	}

	private func createReturningAgentPINInputViewController(agent: Agent) -> PINInputViewController {

		let pinViewModel = ReturningAgentPINInputViewModel(agent: agent)
		return createPINInputViewController(viewModel: pinViewModel) { [weak self] in

			guard let self = self else {
				return
			}

			let missionListViewController = self.createMissionListViewController()
			self.navigationController?.setViewControllers([missionListViewController], animated: true)
		}
	}

	private func createPINInputViewController(viewModel: PINInputViewModel, onFinished: @escaping (() -> Void)) -> PINInputViewController {

		return PINInputViewController(viewModel: viewModel, onNavigationEvent: {(event: PINInputViewController.NavigationEvent) in

			guard case .validInput = event else {
				return
			}

			onFinished()
		})
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



	private func createMissionListViewController() -> MissionListViewController {

		return MissionListViewController()
	}

}
