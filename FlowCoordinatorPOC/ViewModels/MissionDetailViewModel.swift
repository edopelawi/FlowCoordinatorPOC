//
//  MissionDetailViewModel.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

struct MissionDetailViewModel {

	enum ActionType: String {
		case accept = "Accept"
		case retry = "Retry"
	}

	private let mission: Mission

	var name: String {
		return mission.name
	}

	var description: String {
		return mission.description
	}

	var actionType: ActionType {

		if mission.finished {
			return .retry
		} else {
			return .accept
		}
	}




	init(mission: Mission) {
		self.mission = mission
	}
}
