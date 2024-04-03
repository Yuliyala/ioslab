//
//  PopularityView.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 4/3/24.
//

import UIKit

class KnownForPopularityView: UIView {
    
    private let popularityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()

    private let popularityLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupViews() {
        addSubview(popularityLabel)
        addSubview(popularityLineView)
        
        popularityLineView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(10)
            make.width.equalTo(100)
        }
        
        popularityLabel.snp.makeConstraints { make in
            make.leading.equalTo(popularityLineView.snp.trailing).offset(8)
            make.centerY.equalTo(popularityLineView)
        }
    }

    func setPopularity(knownFor: KnownFor) {
        popularityLabel.text = String(format: "%.2f", knownFor.popularity)
        updateLineViewWidth(popularity: knownFor.popularity)
    }
    
    private func updateLineViewWidth(popularity: Double) {
        let minPopularity: Double = 0
        let maxPopularity: Double = 2500
        
        let minWidth: CGFloat = 30
        let maxWidth: CGFloat = 220
        
        var width: CGFloat
        if popularity >= maxPopularity {
            width = maxWidth
        } else if popularity <= minPopularity {
            width = minWidth
        } else {
            width = minWidth + CGFloat(popularity / maxPopularity) * (maxWidth - minWidth)
        }
        
        popularityLineView.snp.updateConstraints { make in
            make.width.equalTo(width)
        }
        
        popularityLineView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: 5)
        gradientLayer.colors = [UIColor.gray.cgColor, UIColor.green.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        popularityLineView.layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
