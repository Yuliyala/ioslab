//
//  MovieDetailViewController.swift
//  ioslab
//
//  Created by Yuliya Lapenak on 1/17/24.
//

import UIKit
import SnapKit

class MovieDetailViewController: UIViewController {

    private let movie: Movie

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

