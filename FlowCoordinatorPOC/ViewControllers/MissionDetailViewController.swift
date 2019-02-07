//
//  MissionDetailViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class MissionDetailViewController: UIViewController {

	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var actionButton: UIButton!

	private var viewModel: MissionDetailViewModel?

	convenience init(viewModel: MissionDetailViewModel) {
		self.init()
		self.viewModel = viewModel
	}

	override func viewDidLoad() {
        super.viewDidLoad()

		configureView()
    }

	// MARK: - Private methods -
	
	@IBAction private func executeAction(_ sender: Any) {
	}

	private func configureView() {

		guard let viewModel = self.viewModel else {
			return
		}

		self.title = viewModel.name
		self.descriptionTextView.text = viewModel.description
		self.actionButton.setTitle(viewModel.actionType.rawValue, for: .normal)
	}

}
