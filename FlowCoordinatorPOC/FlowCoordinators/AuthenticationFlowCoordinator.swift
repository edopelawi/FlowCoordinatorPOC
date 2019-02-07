//
//  AuthenticationFlowCoordinator.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class AuthenticationFlowCoordinator {

	enum NavigationEvent {
		case toMissionList
	}

	var navigationController: UINavigationController?
	var onNavigationEvent: ((NavigationEvent) -> Void)?

	func createInitialViewController() -> UIViewController {

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
		return createPINInputViewController(viewModel: pinViewModel)
	}

	private func createReturningAgentPINInputViewController(agent: Agent) -> PINInputViewController {

		let pinViewModel = ReturningAgentPINInputViewModel(agent: agent)
		return createPINInputViewController(viewModel: pinViewModel)
	}

	private func createPINInputViewController(viewModel: PINInputViewModel) -> PINInputViewController {

		return PINInputViewController(viewModel: viewModel, onNavigationEvent: { [weak self] (event: PINInputViewController.NavigationEvent) in

			guard case .validInput = event else {
				return
			}

			self?.onNavigationEvent?(.toMissionList)
		})
	}
	
}
