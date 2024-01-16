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
    private var controllers:  [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        addCategoryController(for: .newMovies)
        addCategoryController(for: .popular)
        addCategoryController(for: .trending)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollContainerView)
        scrollContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func pushController(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func addCategoryController(for category: Category) {
        let categoryController = MoviesCollectionViewController(category: category)
        controllers.append(categoryController)
        scrollContainerView.addViewToContainer(categoryController.view, height: 350)
        addChild(categoryController)
    }
    
    private func addControllers() {
        addCategoryController(for: .newMovies)
        addCategoryController(for: .popular)
        addCategoryController(for: .trending)
    }
}
