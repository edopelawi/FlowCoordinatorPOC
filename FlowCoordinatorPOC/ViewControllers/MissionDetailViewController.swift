//
//  MissionDetailViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class MissionDetailViewController: UIViewController {

	enum NavigationEvent {
		case confirmPIN
	}

	var onNavigationEvent: ((NavigationEvent) -> Void)?

	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var actionButton: UIButton!

	private var viewModel: MissionDetailViewModel?

	convenience init(viewModel: MissionDetailViewModel, onNavigationEvent: @escaping ((NavigationEvent) -> Void)) {
		self.init()

		self.viewModel = viewModel
		self.onNavigationEvent = onNavigationEvent
	}

	override func viewDidLoad() {
        super.viewDidLoad()

		configureView()
    }

	// MARK: - Private methods -

	private func configureView() {

		guard let viewModel = self.viewModel else {
			return
		}

		self.title = viewModel.name
		self.descriptionTextView.text = viewModel.description
		self.actionButton.setTitle(viewModel.actionType.rawValue, for: .normal)
	}

	@IBAction private func executeAction(_ sender: Any) {
		onNavigationEvent?(.confirmPIN)
	}
}
