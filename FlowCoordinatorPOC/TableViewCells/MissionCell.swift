//
//  MissionCell.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class MissionCell: UITableViewCell {

	static let reuseIdentifier = "MissionCell"

	@IBOutlet private weak var missionNameLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
    }

	func configure(for mission: Mission) {
		missionNameLabel.text = mission.name
	}
}
