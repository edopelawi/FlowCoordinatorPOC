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

		self.title = self.viewModel?.name
		self.descriptionTextView.text = self.viewModel?.description
    }
	
	@IBAction func executeAction(_ sender: Any) {
	}

}
