//
//  OptionView.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit

class OptionView<Enum: OptionCaseIterable>: UIControl {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView().preparedForAutolayout()

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24)
        ])

        return imageView
    }()
    lazy var containerView: UIView = {
        let view = UIView().preparedForAutolayout()
        view.isUserInteractionEnabled = false

        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel().preparedForAutolayout()

        label.setContentHuggingPriority(.required, for: .horizontal)

        return label
    }()

    private var viewModel: OptionViewModel<Enum>

    init(frame: CGRect = .zero, viewModel: OptionViewModel<Enum>) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()

        setupContent()
        bindViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)

        containerView.centerInParent()

        titleLabel.fillSuperviewVertically()
        imageView.fillSuperviewVertically()

        cornerRadius = 4

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    func bindViewModel() {
        viewModel.output = { [weak self] output in
            switch output {
            case .update:
                self?.setupContent()
            }
        }
    }

    func setupContent() {
        imageView.image = UIImage(named: viewModel.option.imageName)
        imageView.tintColor = viewModel.isSelected ? Asset.Colors.pureWhite.color : Asset.Colors.gray.color

        titleLabel.text = viewModel.option.title
        titleLabel.textColor = viewModel.isSelected ? Asset.Colors.pureWhite.color : Asset.Colors.gray.color
        let fontStyle = viewModel.isSelected ? PoppinsFontStyle.semiBold : PoppinsFontStyle.regular
        titleLabel.font = .init(commonFont: fontStyle, size: 14)

        backgroundColor = viewModel.isSelected ? Asset.Colors.halfBaked.color : .clear
        borderWidth = viewModel.isSelected ? 0 : 1
        borderColor = viewModel.isSelected ? .clear : Asset.Colors.lightGray.color
    }
}

class OptionViewModel<Enum: OptionCaseIterable> {
    var option: Enum
    var isSelected: Bool {
        didSet {
            output?(.update)
        }
    }
    var output: ((Output) -> Void)?

    init(with option: Enum, isSelected: Bool = false ) {
        self.option = option
        self.isSelected = isSelected
    }

    enum Output {
        case update
    }
}
