//
//  CategoryViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/17/24.
//


import UIKit
import SnapKit
import Alamofire

final class CategoryViewController: UIViewController {
    var movies: [MovieResult] = []
    private var category: MainScreenCategory!
    var movieService = MovieApiService()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var collectionView: UICollectionView!
    
    init(category: MainScreenCategory) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIElements()
        setupConstraints()
        loadMovies()
    }
    
    func loadMovies() {
        guard let requestType = RequestType(rawValue: category.rawValue) else {
            print("Invalid category")
            return
        }
        
        movieService.fetchMoviesFromAPI (for: requestType) { [weak self] result in
            switch result {
            case .success(let movieResponse):
                self?.movies = movieResponse.results
                self?.collectionView.reloadData()
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    
    private func handleError(_ error: NetworkLayerError) {
        switch error {
        case .networkError(let httpStatus):
            print("Network Error: \(httpStatus.rawValue)")
        case .decodingError:
            print("Decoding Error")
        case .urlCannotBeFormed:
            print("URL Formation Error")
        case .noData:
            print("No Data Error")
        }
    }
    private func setupUIElements() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        titleLabel.text = category.title
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "MovieCollectionViewCell")
        
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
    }
}
