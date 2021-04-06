//
//  CustomDatePicker.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

protocol CustomDatePickerViewDelegate: AnyObject {
    func didTapCancelButton()
    func didTapDoneButton(picker: CustomDatePickerView, date: Date)
}

protocol PickerToolbarProtocol {
    var toolbar: UIToolbar? { get }
}

class CustomDatePickerView: UIDatePicker, PickerToolbarProtocol {

    private(set) var toolbar: UIToolbar?
    weak var toolbarDelegate: CustomDatePickerViewDelegate?
    private let viewModel: CustomDatePickerViewModel

    init(frame: CGRect = .zero,
         viewModel: CustomDatePickerViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        self.commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: 35))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel",
                                           style: .plain,
                                           target: self,
                                           action: #selector(self.cancelTapped))

        toolBar.setItems([cancelButton,
                          spaceButton,
                          doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        if #available(iOS 13.4, *) {
            self.preferredDatePickerStyle = .wheels
        }
        self.toolbar = toolBar
        setupPicker()
    }

    private func setupPicker() {
        self.datePickerMode = .date
        self.maximumDate = Date()

        self.minimumDate = viewModel.minDate
        self.maximumDate = viewModel.maxDate
        self.timeZone = TimeZone(secondsFromGMT: 0)

        self.date = viewModel.selectedDate ?? Date()
    }

    @objc func doneTapped() {
        toolbarDelegate?.didTapDoneButton(picker: self, date: self.date)
    }

    @objc func cancelTapped() {
        toolbarDelegate?.didTapCancelButton()
    }
}
