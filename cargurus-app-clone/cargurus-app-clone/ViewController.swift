//
//  ViewController.swift
//  cargurus-app-clone
//
//  Created by Luke Dreyer on 9/12/21.
//

import UIKit

class ViewController: UIViewController {
    private var loadingViewable: LoadingViewable?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        loadingViewable?.displayLoading()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        loadingViewable?.dismissLoading()
    }


}

// MARK: - private

private extension ViewController {
    func setup() {
        // setup view
        let loadingViewInitializer = LoadingView()
        view.addSubview(loadingViewInitializer)

        // setup constraints
        loadingViewInitializer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingViewInitializer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingViewInitializer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingViewInitializer.topAnchor.constraint(equalTo: view.topAnchor),
            loadingViewInitializer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        loadingViewable = loadingViewInitializer
    }
}
