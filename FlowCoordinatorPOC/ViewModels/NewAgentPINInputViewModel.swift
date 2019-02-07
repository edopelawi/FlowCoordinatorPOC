//
//  NewAgentPINInputViewModel.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

final class NewAgentPINInputViewModel: PINInputViewModel {

	let agentName: String

	init(agentName: String) {
		self.agentName = agentName
	}

	func validate(pinInput: String) -> Bool {

		let newAgent = Agent(codename: agentName, secretPIN: pinInput)
		AgentStorage.shared.store(agent: newAgent)

		return true
	}
}
