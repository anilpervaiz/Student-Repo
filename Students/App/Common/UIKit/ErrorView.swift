//
//  ErrorView.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import UIKit

class ErrorView: UIView {
    var errors: [String] = [] {
        didSet {
            setupErrorStack()
        }
    }
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }

    lazy var titleLabel: UILabel = {
        let title = UILabel().preparedForAutolayout()

        title.setContentCompressionResistancePriority(.required, for: .vertical)
        title.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 14)
        title.textColor = Asset.Colors.darkBlue.color

        return title
    }()

    lazy var errorStackView: UIStackView = {
        let stackView = UIStackView().preparedForAutolayout()

        stackView.setContentCompressionResistancePriority(.required, for: .vertical)
        stackView.axis = .vertical
        stackView.spacing = 0
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
        addSubview(titleLabel)
        addSubview(errorStackView)

        backgroundColor = Asset.Colors.tomatoRed.color.withAlphaComponent(0.02)
        self.borderWidth = 1
        self.borderColor = Asset.Colors.tomatoRed.color

        titleLabel.fillSuperviewHorizontally(leading: 12, trailing: 12)
        errorStackView.fillSuperviewHorizontally(leading: 12, trailing: 12)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            errorStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            errorStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

    func setupErrorStack() {
        errorStackView.removeSubviews()

        for error in errors {
            let label = UILabel().preparedForAutolayout()

            label.setContentCompressionResistancePriority(.required, for: .vertical)
            label.font = .init(commonFont: PoppinsFontStyle.regular, size: 14)
            label.textColor = Asset.Colors.darkBlue.color
            label.text = "• \(error)"

            errorStackView.addArrangedSubview(label)
        }
    }
}
