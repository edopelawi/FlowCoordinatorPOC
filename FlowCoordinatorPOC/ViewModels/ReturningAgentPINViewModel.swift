//
//  ReturningAgentPINViewModel.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

final class ReturningAgentPINInputViewModel: PINInputViewModel {

	let currentAgent: Agent

	init(agent: Agent) {
		self.currentAgent = agent
	}

	func validate(pinInput: String) -> Bool {
		return pinInput == currentAgent.secretPIN
	}
}
