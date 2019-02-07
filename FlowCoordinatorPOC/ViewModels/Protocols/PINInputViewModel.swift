//
//  PINInputViewModel.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import Foundation

protocol PINInputViewModel {

	/// Returns `true` if passed `pinInput` is valid, `false` if not.
	func validate(pinInput: String) -> Bool
}
