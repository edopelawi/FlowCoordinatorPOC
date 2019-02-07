//
//  MissionListViewController.swift
//  FlowCoordinatorPOC
//
//  Created by Ricardo Pramana Suranta on 07/02/19.
//  Copyright © 2019 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class MissionListViewController: UIViewController {

	@IBOutlet private weak var tableView: UITableView!
	private let viewModel = MissionListViewModel()

	override func viewDidLoad() {
        super.viewDidLoad()

		title = "Missions"
		
		configureTableView()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		navigationController?.isNavigationBarHidden = false
		navigationItem.largeTitleDisplayMode = .always
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		tableView.reloadData()
	}

	// MARK: - Private methods -

	private func configureTableView() {

		let cellNib = UINib(nibName: MissionCell.reuseIdentifier, bundle: nil)
		tableView.register(cellNib, forCellReuseIdentifier: MissionCell.reuseIdentifier)
	}



}

extension MissionListViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.missions.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(withIdentifier: MissionCell.reuseIdentifier, for: indexPath) as? MissionCell else {
			return UITableViewCell()
		}

		let mission = viewModel.missions[indexPath.row]
		cell.configure(for: mission)

		return cell
	}

}

extension MissionListViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		guard indexPath.row < viewModel.missions.count else {
			return
		}

		let mission = viewModel.missions[indexPath.row]
		let detailViewModel = MissionDetailViewModel(mission: mission)

		let detailViewController = MissionDetailViewController(viewModel: detailViewModel)
		self.navigationController?.pushViewController(detailViewController, animated: true)
	}
}
