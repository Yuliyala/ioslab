//
//  MovieCollectionViewCell.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    let imageUrlService = ImageUrlService()
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let ratingBadge: RatingBadgeView = {
        let badgeView = RatingBadgeView()
        return badgeView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("•••", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        button.layer.cornerRadius = 12.5
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func configure(with movie: MovieResult) {
        let roundedRating = Int(movie.voteAverage)
        print(roundedRating)
        ratingBadge.configure(with: roundedRating)
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        
        let posterPath = movie.posterPath
        if let imageUrl = imageUrlService.imageUrl(forPath: posterPath) {
            albumImageView.kf.setImage(with: imageUrl)
        }
    }

    
    
    private func setupViews() {
        addSubview(albumImageView)
        addSubview(ratingBadge)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        addSubview(actionButton)
        
        albumImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        
        ratingBadge.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-2)
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(45)
        }
        
        actionButton.snp.makeConstraints { make in
            make.top.equalTo(albumImageView).offset(10)
            make.trailing.equalTo(albumImageView).offset(-14)
            make.size.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImageView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
    }
}

