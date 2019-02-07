//
//  PINInputViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class PINInputViewController: UIViewController {

	enum NavigationEvent {
		case validInput
	}

	var onNavigationEvent: ((NavigationEvent) -> Void)?

	@IBOutlet private weak var inputTextField: UITextField!

	private var viewModel: PINInputViewModel?

	convenience init(viewModel: PINInputViewModel, onNavigationEvent: ((NavigationEvent) -> Void)? = nil) {
		self.init()

		self.viewModel = viewModel
		self.onNavigationEvent = onNavigationEvent
	}

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

		guard let viewModel = viewModel else {
			return
		}

		let currentText = inputTextField.text

		guard let inputText = currentText,
			inputText.count >= 4 else {
				return
		}

		let validInput = viewModel.validate(pinInput: inputText)

		if validInput {
			self.onNavigationEvent?(.validInput)			
		} else {
			inputTextField.text = ""
			presentInvalidError()
		}
	}

	private func presentInvalidError() {

		let alertController = UIAlertController(title: "Error", message: "Invalid input.", preferredStyle: .alert)

		let alertAction = UIAlertAction(
			title: "OK",
			style: .default,
			handler: { [weak self] _ -> Void in
				self?.dismiss(animated: true, completion: nil)
		})

		alertController.addAction(alertAction)

		self.present(alertController, animated: true, completion: nil)
	}
}
