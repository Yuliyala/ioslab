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
        return label
    }()
    
    private let borderLayer = CAShapeLayer()
    
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
        setNeedsLayout()
    }
    
    private func setupViews() {
        addSubview(badgeLabel)
        badgeLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let ratingPercentage = CGFloat(Int(badgeLabel.text ?? "") ?? 0) / 10.0
        let endAngle = 2 * CGFloat.pi * ratingPercentage - CGFloat.pi / 2
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: badgeLabel.bounds.midX, y: badgeLabel.bounds.midY),
                                      radius: badgeLabel.bounds.width / 2,
                                      startAngle: -CGFloat.pi / 2,
                                      endAngle: endAngle,
                                      clockwise: true)
        
        borderLayer.frame = bounds
        borderLayer.lineWidth = 4
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.green.cgColor
        borderLayer.path = circlePath.cgPath
        layer.addSublayer(borderLayer)
    }
}
