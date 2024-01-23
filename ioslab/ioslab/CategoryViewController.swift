//
//  CategoryViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/17/24.
//


import UIKit
import SnapKit

final class CategoryViewController: UIViewController {
   
    private var category: MainScreenMovieCategory!
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var collectionView: UICollectionView!

    init(category: MainScreenMovieCategory) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIElements()
        setupConstraints()
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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        let movie = mockMovies[indexPath.item]
        cell.configure(with: movie)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = mockMovies[indexPath.item]
        let movieDetailViewController = MovieDetailViewController(movie: movie)
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2.5
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}

// MARK: - MockDataExtension
extension CategoryViewController {
    var mockMovies: [Movie] {
        return [
            Movie(albumImageUrl: "https://picsum.photos/200/300?1", rating: 4.5, title: "Movie 1", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?2", rating: 4.5, title: "Movie 2", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?3", rating: 4.5, title: "Movie 3", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?4", rating: 4.5, title: "Movie 4", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?5", rating: 4.5, title: "Movie 5", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?6", rating: 4.5, title: "Movie 6", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?7", rating: 4.5, title: "Movie 7", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?8", rating: 4.5, title: "Movie 8", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?9", rating: 7, title: "Movie 7", releaseDate: "2022-01-15"),
            Movie(albumImageUrl: "https://picsum.photos/200/300?10", rating: 6, title: "Movie 8", releaseDate: "2022-01-15")
        ]
    }
}
