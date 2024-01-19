//
//  ContainerViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//

import UIKit
import SnapKit

class ContainerViewController: UIViewController {

    private var scrollContainerView = ScrollContainerView()
    private var controllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        addCategoryController(for: .popular)
        addCategoryController(for: .trending)
        addCategoryController(for: .newMovies)
    }

    private func setupScrollView() {
        view.addSubview(scrollContainerView)
        scrollContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func addCategoryController(for category: Category) {
        let categoryController = CategoryViewController()
        categoryController.titleText = category.rawValue 
        controllers.append(categoryController)
        scrollContainerView.addViewToContainer(categoryController.view, height: 370)
        addChild(categoryController)
    }
}
