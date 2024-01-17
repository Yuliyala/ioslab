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
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let ratingBadge: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .black
        label.layer.cornerRadius = 24.5
        label.layer.masksToBounds = true
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.green.cgColor
        return label
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
           // Use Kingfisher to load the image
           if let imageUrl = URL(string: movie.albumImageUrl) {
               albumImageView.kf.setImage(with: imageUrl)
           }

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
                make.height.equalTo(240)
            }
            
            ratingBadge.snp.makeConstraints { make in
                make.bottom.equalTo(albumImageView).offset(-8)
                make.leading.equalTo(albumImageView).offset(12)
                make.size.equalTo(49)
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
