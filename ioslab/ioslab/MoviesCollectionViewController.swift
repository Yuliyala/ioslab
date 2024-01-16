//
//  MoviesCollectionViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//


import UIKit

class MoviesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var movies: [Movie] = []
    let category: Category

    init(category: Category) {
        self.category = category
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "MovieCell")

        generateMockData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: collectionView.frame.height)
    }

    private func generateMockData() {
        for _ in 1...10 {
            let movie = Movie(
                albumImageUrl: "https://picsum.photos/200/300",
                rating: Double.random(in: 1...5),
                title: "\(category.rawValue) Movie Title",
                releaseDate: "2022-01-15"
            )
            movies.append(movie)
        }
    }

}



