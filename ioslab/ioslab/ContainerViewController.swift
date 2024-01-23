//
//  ContainerViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//

import UIKit
import SnapKit

class ContainerViewController: UIViewController {

    private var rootView: ScrollContainerView!

    private var controllers: [UIViewController] = []

    override func loadView() {
        rootView = ScrollContainerView()
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addCategoryController(for: .popular)
        addCategoryController(for: .trending)
        addCategoryController(for: .newMovies)
    }

    private func addCategoryController(for category: MainScreenMovieCategory) {
        let categoryController = CategoryViewController(category: category)
        categoryController.title = category.title
        controllers.append(categoryController)
        rootView.addViewToContainer(categoryController.view, height: 370)
        addChild(categoryController)
    }
}
