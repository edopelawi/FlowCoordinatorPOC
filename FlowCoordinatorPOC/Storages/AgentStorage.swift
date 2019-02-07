//
//  AgentStorage.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

final class AgentStorage {

	static let shared = AgentStorage()

	private let nameKey = "agent_name"
	private let pinKey = "agent_pin"

	private let userDefaults = UserDefaults.standard

	private init() {}

	/// Returns stored agent, if any.
	func getStoredAgent() -> Agent? {

		guard let agentName = userDefaults.string(forKey: nameKey),
			let agentPIN = userDefaults.string(forKey: pinKey) else {
			return nil
		}

		return Agent(
			codename: agentName,
			secretPIN: agentPIN
		)
	}

	/// Store passed agent.
	func store(agent: Agent) {

		userDefaults.setValue(agent.codename, forKey: nameKey)
		userDefaults.setValue(agent.secretPIN, forKey: pinKey)
	}
}
