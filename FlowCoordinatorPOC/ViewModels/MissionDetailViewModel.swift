//
//  MissionDetailViewModel.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct MissionDetailViewModel {

	private let mission: Mission

	var name: String {
		return mission.name
	}

	var description: String {
		return mission.description
	}

	init(mission: Mission) {
		self.mission = mission
	}
}
