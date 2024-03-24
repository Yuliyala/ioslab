//
//  ScrollContainerView.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//

import UIKit
import SnapKit

final class ScrollContainerView: UIView {

    private var views = [UIView]()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    private func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
    }

    func addViewToContainer(_ view: UIView) {
        views.append(view)
        stackView.addArrangedSubview(view)
    }
}

