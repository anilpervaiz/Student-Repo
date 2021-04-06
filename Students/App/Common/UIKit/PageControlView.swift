//
//  PageControlView.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import UIKit

class PageControlView: UIView {

    var numberOfPages: Int = 0 {
        didSet { setupPages() }
    }

    var currentPage: Int = 0 {
        didSet { setCurrentSelectedPage(to: currentPage) }
    }

    var selectedPageColor = Asset.Colors.aquaMarine.color
    var pageColor = Asset.Colors.sapphireLight.color

    lazy var stackView: UIStackView = {
        let stackView = UIStackView().preparedForAutolayout()
        stackView.spacing = 6
        stackView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    func setupView() {
        addSubview(stackView)
        stackView.fillSuperview()
    }

    func setupPages() {
        stackView.removeSubviews()
        for count in 0..<numberOfPages {
            let page = UIView().preparedForAutolayout()
            page.widthAnchor.constraint(equalTo: page.heightAnchor).isActive = true
            page.tag = count
            page.cornerRadius = 4

            page.widthAnchor.constraint(equalToConstant: 8).isActive = true
            page.heightAnchor.constraint(equalTo: page.widthAnchor).isActive = true

            stackView.addArrangedSubview(page)
        }
        setCurrentSelectedPage(to: 0)
    }

    func setCurrentSelectedPage(to index: Int) {
        for view in stackView.subviews {
            if view.tag == index {
                view.backgroundColor = selectedPageColor
                UIView.animate(withDuration: 0.2) {
                    view.changeWidth(to: 10)
                } completion: { _ in
                    view.layoutIfNeeded()
                }
                view.cornerRadius = 5
            } else {
                view.backgroundColor = pageColor
                UIView.animate(withDuration: 0.2) {
                    view.changeWidth(to: 8)
                } completion: { _ in
                    view.layoutIfNeeded()
                }
                view.cornerRadius = 4
            }
        }
    }
}
