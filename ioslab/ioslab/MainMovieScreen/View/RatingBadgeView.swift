//
//  RatingBadgeView.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/18/24.
//



import UIKit

class RatingBadgeView: UIView {
    
    private let badgeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .black
        label.layer.cornerRadius = 22.5
        label.layer.masksToBounds = true
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.green.cgColor
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
    
    func configure(with rating: Int) {
        badgeLabel.text = "\(rating)"
        

        if rating < 3 {
            badgeLabel.layer.borderColor = UIColor.red.cgColor
        } else if rating < 7 {

            badgeLabel.layer.borderColor = UIColor.orange.cgColor
        } else {
            badgeLabel.layer.borderColor = UIColor.green.cgColor
        }
    }
    
    private func setupViews() {
        addSubview(badgeLabel)
        
        badgeLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
