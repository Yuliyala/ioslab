//
//  ContainerViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/15/24.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private var rootView: ScrollContainerView!
    private var controllers: [UIViewController] = []
    private var actorsController: PopularActorsViewController!
    
    override func loadView() {
        rootView = ScrollContainerView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addCategoryController(for: .nowPlayingMovies)
        addCategoryController(for: .topRatedMovies)
        addCategoryController(for: .popularMovies)
        addActorsController()
    }
    
    private func addCategoryController(for category: MainScreenCategory) {
        let categoryController = CategoryViewController(category: category)
        categoryController.title = category.title
      
        controllers.append(categoryController)
        rootView.addViewToContainer(categoryController.view)
        addChild(categoryController)
        categoryController.loadMovies()
    }
    private func addActorsController() {
        let actorsController = PopularActorsViewController()
        controllers.append(actorsController)
        rootView.addViewToContainer(actorsController.view)
        addChild(actorsController)
    }

}
