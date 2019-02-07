//
//  PINInputViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class PINInputViewController: UIViewController {

	@IBOutlet private weak var inputTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()

		configureTextField()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.isNavigationBarHidden = true
		navigationItem.largeTitleDisplayMode = .never
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		inputTextField.becomeFirstResponder()
	}

	// MARK: - Private methods -

	private func configureTextField() {
		inputTextField.addTarget(self, action: #selector(inputChanged(_:)), for: .editingChanged)
	}
	
	@objc private func inputChanged(_ sender: Any) {

		let currentText = inputTextField.text

		guard let validText = currentText,
			validText.count >= 4 else {
				return
		}

		navigateToMissionList()
	}

	private func navigateToMissionList() {

		let missionListViewController = MissionListViewController()

		self.navigationController?.setViewControllers([missionListViewController], animated: true)
	}
}
