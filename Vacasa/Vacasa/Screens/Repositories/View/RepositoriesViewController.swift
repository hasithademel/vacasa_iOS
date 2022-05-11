//
//  ViewController.swift
//  Vacasa
//
//  Created by Hasitha De Mel on 10/05/22.
//

import UIKit
import Combine

class RepositoriesViewController: UIViewController {

    lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        return indicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        NSLayoutConstraint(item: tableView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self.view, attribute: .centerX,
                           multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view, attribute: .leading,
                           multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .trailing,
                           relatedBy: .equal, toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .top,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .bottom,
                           relatedBy: .equal, toItem: self.view,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        
        
        return tableView
    }()
    
    
    // MARK: - Properties
    let viewModel: RepositoriesViewModel = RepositoriesViewModel()
    private var cancellables: Set<AnyCancellable> = []
    static let cellIdentifier = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Repositories"
        self.view.backgroundColor = .white

        self.view.addSubview(tableView)
        self.view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        initBinding()
        viewModel.loadRepositories()

    }
    
    private func initBinding() {
        viewModel.$repos
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {_ in self.renderdata()})
            .store(in: &cancellables)
    }

    private func renderdata() {
        self.tableView.reloadData()
        self.loadingIndicator.stopAnimating()
    }
}

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRepos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Self.cellIdentifier)
        let repo = viewModel.repoAt(row: indexPath.row)
        cell.textLabel?.text = repo.name
        cell.detailTextLabel?.text = repo.description
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}
