//
//  LoadingView.swift
//  cargurus-app-clone
//
//  Created by Luke Dreyer on 9/12/21.
//

import Foundation
import UIKit

protocol LoadingProvider {
    var loadingView: LoadingViewable { get set }
}

protocol LoadingViewable {
    func displayLoading()
    func dismissLoading()
}

final class LoadingView: UIView {
    private enum Constants {
        static let defaultViewSize: CGFloat = 16
        static let animatedButtonWidth: CGFloat = 260
    }
    private var loadingIcon: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: Constants.defaultViewSize, height: Constants.defaultViewSize))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        return view
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private

private extension LoadingView {
    func setup() {
        addSubview(loadingIcon)

        NSLayoutConstraint.activate([
            loadingIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingIcon.centerXAnchor.constraint(equalTo: centerXAnchor),

            loadingIcon.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.defaultViewSize),
            loadingIcon.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.defaultViewSize)
        ])
    }
}

// MARK: - LoadingViewAble

extension LoadingView: LoadingViewable {
    func displayLoading() {
        UIView.animate(withDuration: 5.0) {
            self.loadingIcon.frame = CGRect(x: 0, y: 0, width: Constants.animatedButtonWidth, height: Constants.animatedButtonWidth)
            self.loadingIcon.center = self.center
        }
    }

    func dismissLoading() {
        // no-op
        // TODO: - Implement
    }
}
