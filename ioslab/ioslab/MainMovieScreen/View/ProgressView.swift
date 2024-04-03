//
//  ProgressView.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 4/4/24.
//

import Foundation
import UIKit

class ProgressView: UIView {
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()

    let progressLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()

    func setupViews() {
        addSubview(progressLabel)
        addSubview(progressLineView)
        
        progressLineView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(8)
            make.width.equalTo(100)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.leading.equalTo(progressLineView.snp.trailing).offset(8)
            make.centerY.equalTo(progressLineView.snp.centerY)
        }
        
    }

    func setProgress(progress: Double, colors: [UIColor]) {
        progressLabel.text = String(format: "%.2f", progress)
        updateView(progress: progress, colors: colors)
    }
    
    func updateView(progress: Double, colors: [UIColor]) {
        let minProgress: Double = 0
        let maxProgress: Double = 100
        
        let minWidth: CGFloat = 20
        let maxWidth: CGFloat = 220
        
        var width: CGFloat
        if progress >= maxProgress {
            width = maxWidth
        } else if progress <= minProgress {
            width = minWidth
        } else {
            width = minWidth + CGFloat(progress / maxProgress) * (maxWidth - minWidth)
        }
        
        progressLineView.snp.updateConstraints { make in
            make.width.equalTo(width)
        }
        
        progressLineView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: 8)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        progressLineView.layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
