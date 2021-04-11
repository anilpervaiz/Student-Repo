//
//  OptionSelectionView.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit

class OptionSelectionView<Enum: OptionCaseIterable>: UIControl {

    var title: String = ""

    var viewModel: OptionSelectionViewModel<Enum>?

    lazy var stackView: UIStackView = {
        let stackView = UIStackView().preparedForAutolayout()
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel().preparedForAutolayout()

        label.font = .init(commonFont: PoppinsFontStyle.medium, size: 14)
        label.textColor = Asset.Colors.gray.color

        return label
    }()
    func configure(with options: [Enum], title: String) {
        self.viewModel = OptionSelectionViewModel(with: options)
        self.titleLabel.text = title
        setupView()
    }

    func setupView() {

        titleLabel.removeFromSuperview()
        stackView.removeFromSuperview()
        stackView.removeSubviews()

        addSubview(titleLabel)
        addSubview(stackView)
        titleLabel.fillSuperviewHorizontally()
        stackView.fillSuperviewHorizontally()

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        for index in 0..<(viewModel?.numberOfOptions ?? 0) {
            guard let optionViewModel = viewModel?.option(at: index) else { return }
            let optionView = OptionView(viewModel: optionViewModel).preparedForAutolayout()
            optionView.tag = index
            optionView.isUserInteractionEnabled = true
            optionView.addTarget(self, action: #selector(didSelectOption(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(optionView)
        }
    }

    @objc
    func didSelectOption(sender: UIView) {
        viewModel?.didSelectOption(at: sender.tag)
    }
}

class OptionSelectionViewModel<Enum: OptionCaseIterable> {
    private var options: [OptionViewModel<Enum>] = []

    var numberOfOptions: Int { options.count }

    init(with options: [Enum]) {
        setupData(with: options)
    }

    func setupData(with options: [Enum]) {
        self.options = options.compactMap{ OptionViewModel(with: $0) }
    }

    func didSelectOption(at index: Int) {
        for iterator in 0..<options.count {
            options[iterator].isSelected = false
        }
        options[index].isSelected = true
    }

    func option(at index: Int) -> OptionViewModel<Enum> {
        options[index]
    }
}

protocol LocalizableCaseIterable: CaseIterable, RawRepresentable {
    var title: String { get }
}

protocol OptionCaseIterable: LocalizableCaseIterable {
    var imageName: String { get }
}
