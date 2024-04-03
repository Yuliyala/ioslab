//
//  ActorTableViewCell.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 3/29/24.
//

import UIKit
import SnapKit
import Kingfisher

class ActorTableViewCell: UITableViewCell {
    
    let imageUrlService = ImageUrlService()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let actorPopularityView = ActorPopularityView()
    private let popularityView = KnownForPopularityView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(actorPopularityView)
        addSubview(popularityView)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(80)
            make.height.equalTo(profileImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        popularityView.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).inset(-10)
        }
        actorPopularityView.snp.makeConstraints { make in
            make.leading.equalTo(popularityView.snp.leading)
            make.top.equalTo(popularityView.snp.bottom).inset(-16)
        }
    }
    
    func configure(with actor: ActorResult, knownFor: [KnownFor], cellWidth: CGFloat) {
        nameLabel.text = actor.name

        if let firstKnownFor = knownFor.first {
            popularityView.setPopularity(knownFor: firstKnownFor)
        }
        
        actorPopularityView.setActorPopularity(actor: actor)
        
        let profilePath = actor.profilePath ?? ""
        if let imageUrl = imageUrlService.imageUrl(forPath: profilePath) {
            profileImageView.kf.setImage(with: imageUrl)
        } else {
            profileImageView.image = nil
            profileImageView.backgroundColor = .lightGray
            profileImageView.contentMode = .center
            profileImageView.clipsToBounds = true
            profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
            nameLabel.text = String(actor.name.prefix(1))
        }
    }
}
