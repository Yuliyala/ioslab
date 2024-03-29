//
//  PopularActorsViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/26/24.
//

import UIKit
import SnapKit

class PopularActorsViewController: UIViewController {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.text = "Popular Actors"
        return label
    }()

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    private var popularActors: [ActorResult] = []
    private let apiService = MovieApiService()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        loadActors()
    }

    private func setupViews() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(tableView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        tableView.snp.makeConstraints { make in
            make.height.equalTo(600)
        }

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ActorTableViewCell.self, forCellReuseIdentifier: "ActorCell")
    }

    func loadActors() {
        apiService.fetchActorsFromAPI { [weak self] result in
            switch result {
            case .success(let actors):
                self?.popularActors = actors.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching popular actors: \(error)")
            }
        }
    }
}

extension PopularActorsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularActors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for: indexPath) as! ActorTableViewCell
        let actor = popularActors[indexPath.row]
        cell.configure(with: actor)
        return cell
    }
}

