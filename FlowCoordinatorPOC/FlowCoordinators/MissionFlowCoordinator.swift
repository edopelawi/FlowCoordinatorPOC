//
//  MissionFlowCoordinator.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class MissionFlowCoordinator {

	var navigationController: UINavigationController?


	func setInitialViewController() {

		let listViewController = createMissionListViewController()
		self.navigationController?.setViewControllers([ listViewController ], animated: true)
	}

	// MARK: - Private methods -

	private func createMissionListViewController() -> MissionListViewController {

		return MissionListViewController(onNavigationEvent: { [weak self] (event: MissionListViewController.NavigationEvent) in

			guard let self = self,
				case .toDetail(let mission) = event else {
				return
			}

			let detailViewController = self.createMissionDetailViewController(mission: mission)
			self.navigationController?.pushViewController(detailViewController, animated: true)
		})
	}

	private func createMissionDetailViewController(mission: Mission) -> MissionDetailViewController {

		let detailViewModel = MissionDetailViewModel(mission: mission)

		return MissionDetailViewController(viewModel: detailViewModel, onNavigationEvent: { [weak self] (event: MissionDetailViewController.NavigationEvent) in

			guard case .confirmPIN = event,
				let pinInputViewController = self?.createPINInputViewController() else {
				return
			}

			self?.navigationController?.pushViewController(pinInputViewController, animated: true)

		})
	}

	private func createPINInputViewController() -> PINInputViewController? {

		guard let currentAgent = AgentStorage.shared.getStoredAgent() else {
			return nil
		}

		let pinViewModel = ReturningAgentPINInputViewModel(agent: currentAgent)
		return PINInputViewController(viewModel: pinViewModel) { [weak self] (event: PINInputViewController.NavigationEvent) in

			guard case .validInput = event else {
				return
			}

			self?.popBackToMissionList()
		}
	}

	private func popBackToMissionList() {
		self.navigationController?.popToRootViewController(animated: true)
	}

}
