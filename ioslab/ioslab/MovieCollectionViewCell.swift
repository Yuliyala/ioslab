//
//  MovieCollectionViewCell.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//


import UIKit
import SnapKit

class MovieCollectionViewCell: UICollectionViewCell {
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let ratingBadge: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .black
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.darkGray.cgColor
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func configure(with movie: Movie) {
        albumImageView.downloadImage(from: movie.albumImageUrl)
        let roundedRating = Int(round(movie.rating))
        ratingBadge.text = "\(roundedRating)"
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
    }

    private func setupViews() {
        addSubview(albumImageView)
        addSubview(ratingBadge)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        
        albumImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
        ratingBadge.snp.makeConstraints { make in
            make.bottom.equalTo(albumImageView).offset(-8)
            make.leading.equalTo(albumImageView).offset(16)
            make.size.equalTo(32)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
    }
}

extension UIImageView {
    func downloadImage(from url: String) {
        guard let imageUrl = URL(string: url) else { return }

        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid data or unable to create image")
                return
            }

            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
