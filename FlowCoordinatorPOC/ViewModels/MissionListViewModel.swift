//
//  MissionListViewModel.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

final class MissionListViewModel {

	private(set) var missions: [Mission] = []

	init() {
		generateInitialMissions()
	}

	// MARK: - Private methods -

	private func generateInitialMissions() {

		self.missions = Array(1...5).map { (index: Int) -> Mission in
			return Mission(name: "Mission \(index)", finished: false)
		}
	}
}
