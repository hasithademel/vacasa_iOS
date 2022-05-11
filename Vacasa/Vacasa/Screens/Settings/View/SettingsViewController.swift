//
//  SettingsViewController.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 10/05/22.
//

import UIKit

class SettingsTableViewViewController: UITableViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var appVersionValueLabel: UILabel!
    
    // MARK: - Properties
    let viewModel: SettingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        setup()
    }
    
    private func setup() {
        logoImageView.round()
        logoImageView.image = UIImage(named: "logo")
        titleLabel.text = "Vacasa Interview"
        emailLabel.text = "vacasa_interview@vacasa.com"
        
        appVersionValueLabel.text = viewModel.getAppVersion()
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getHeaderForSection(section: section)
    }
}
