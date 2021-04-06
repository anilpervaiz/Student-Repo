//
//  LabelledTextField.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import Foundation
import UIKit

typealias TextFieldChangedCallBack = ((String?) -> Void)
typealias TextFieldTappedCallBack = (() -> Void)
typealias TextFieldFocusChangeCallBack = ((String?) -> Void)

@IBDesignable
class LabelledTextField: CustomNibView {
    //IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var inputTextField: PaddedTextField!
    @IBOutlet private weak var bottomDescriptionLabel: UILabel!
    @IBOutlet weak var errorview: UIView!
    @IBOutlet weak var errorIconImageView: UIImageView! {
        didSet {
            errorIconImageView.tintColor = Asset.Colors.tomatoRed.color
        }
    }

    @IBOutlet private weak var textFieldTrailingIconImageView: UIImageView! {
        didSet {
            textFieldTrailingIconImageView.isUserInteractionEnabled = true
            textFieldTrailingIconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(didTapTrailingIcon)))
        }
    }

    var onTextFieldChanged: TextFieldChangedCallBack?
    var onTextFieldTapped: TextFieldTappedCallBack?
    var onTextFieldFocusChange: TextFieldFocusChangeCallBack?

    private var tap: UITapGestureRecognizer?

    //Regex validator
    var formatValidator: FormatValidatorType?

    @IBOutlet weak var trailingLabel: UILabel! {
        didSet {
            trailingLabel.font = .init(commonFont: PoppinsFontStyle.medium, size: 16)
            trailingLabel.textColor = Asset.Colors.darkBlue.color
        }
    }

    //IBInspectable
    @IBInspectable
    var titleLabelText: String? {
        get {
            titleLabel.text
        } set {
            titleLabel.text = newValue
        }
    }

    var autoCapitalizationType: UITextAutocapitalizationType {
        get {
            inputTextField.autocapitalizationType
        } set {
            inputTextField.autocapitalizationType = newValue
        }
    }

    var titleLabelAttributedString: NSAttributedString? {
        get {
            titleLabel.attributedText
        } set {
            titleLabel.attributedText = newValue
        }
    }

    @IBInspectable
    var titleLabelTextColor: UIColor? {
        get {
            titleLabel.textColor
        } set {
            titleLabel.textColor = newValue
        }
    }

    var titleLabelFont: UIFont? {
        get {
            titleLabel.font
        } set {
            titleLabel.font = newValue
        }
    }

    @IBInspectable
    var placeholderText: String? {
        get {
            inputTextField.placeholder
        } set {
            inputTextField.placeholder = newValue
            setupPlaceholderStyle()
        }
    }

    @IBInspectable
    var placeholderTextColor: UIColor? {
        get {
            inputTextField.placeHolderColor
        } set {
            inputTextField.placeHolderColor = newValue
        }
    }

    var placeholderFont: UIFont? {
        get {
            inputTextField.placeHolderFont
        } set {
            inputTextField.placeHolderFont = newValue
        }
    }

    var editTextFont: UIFont? {
        get {
            inputTextField.font
        } set {
            inputTextField.font = newValue
        }
    }

    @IBInspectable
    var editTextColor: UIColor? {
        didSet {
            inputTextField.textColor = editTextColor
        }
    }

    @IBInspectable
    var editTextCursorColor: UIColor? {
        get {
            inputTextField.tintColor
        } set {
            inputTextField.tintColor = newValue
        }
    }

    @IBInspectable
    var inputText: String? {
        get {
            inputTextField.text ?? ""
        } set {
            inputTextField.text = newValue
        }
    }

    var editTextKeyboardType: UIKeyboardType {
        get {
            inputTextField.keyboardType
        } set {
            inputTextField.keyboardType = newValue
        }
    }

    @IBInspectable
    var secureEntry: Bool {
        get {
            inputTextField.isSecureTextEntry
        } set {
            inputTextField.isSecureTextEntry = newValue
        }
    }

    var firstResponder: Bool = false {
        didSet {
            _ = firstResponder ? inputTextField.becomeFirstResponder() : inputTextField.resignFirstResponder()
        }
    }

    var errorLabelFont: UIFont? {
        get {
            bottomDescriptionLabel.font
        } set {
            bottomDescriptionLabel.font = newValue
        }
    }

    @IBInspectable
    var errorLabelColor: UIColor? {
        didSet {
            bottomDescriptionLabel.textColor  = errorLabelColor
        }
    }

    @IBInspectable
    var isEditable: Bool = true {
        didSet {
            updateTextViewStyle()
        }
    }

    @IBInspectable
    var isTappable: Bool = false {
        didSet {
            if isTappable {
                setupTextFieldGesture()
                updateTextViewStyle()
            } else {
                removeTextFieldGesture()
            }
        }
    }

    var textViewDescription: String? = nil {
        didSet {
            setNormalState()
        }
    }

    var trailingIconStyle: TrailingIconStyle = .none {
        didSet {
            setupTrailingIconStyle()
        }
    }

    var leadingImage: UIImage = .init() {
        didSet {
            let imageView = UIImageView(frame: CGRect(x: 8, y: 0, width: 24, height: 24))
            imageView.image = leadingImage
            inputTextField.leftView = imageView
        }
    }

    @IBInspectable
    var errorIcon: UIImage = Asset.Media.errorIcon.image

    var inputTextFieldInputPickerView: UIView? {
        didSet {
            if let inputTextFieldInputPickerView = inputTextFieldInputPickerView {
                inputTextField.inputView = inputTextFieldInputPickerView
                guard let toolbar = (inputTextFieldInputPickerView as? PickerToolbarProtocol)?.toolbar else { return }
                inputTextField.inputAccessoryView = toolbar
            } else {
                inputTextField.inputView = nil
            }
        }
    }

    override func setupView() {
        super.setupView()

        inputTextField.delegate = self
        inputTextField.autocorrectionType = .no
        setupDefaultTitleLabelStyle()
        setupDefaultTextViewStyle()
        setupDefaultErrorStyle()
        setNormalState()

        inputTextField.textAlignment = .left
        inputTextField.backgroundColor = Asset.Colors.dullWhite.color
    }

    @discardableResult
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        return inputTextField.becomeFirstResponder()
    }

    private func updateTextViewStyle() {
        if isEditable || isTappable {
            self.inputTextField.textColor = editTextColor
        } else {
            self.inputTextField.textColor = Asset.Colors.darkBlue.color
        }
    }

    private func setupDefaultTitleLabelStyle() {
        //Need to use Dimens
        titleLabelFont = UIFont.init(commonFont: PoppinsFontStyle.medium, size: 14)
        titleLabelTextColor = Asset.Colors.gray.color
    }

    private func setupPlaceholderStyle() {
        placeholderFont = UIFont.init(commonFont: PoppinsFontStyle.regular, size: 16)
        placeholderTextColor = Asset.Colors.gray.color
    }

    private func setupDefaultTextViewStyle() {
        setupPlaceholderStyle()
        editTextFont = UIFont.init(commonFont: PoppinsFontStyle.regular, size: 16)
        editTextColor = Asset.Colors.darkBlue.color
        editTextCursorColor = Asset.Colors.darkBlue.color
    }

    private func setupDefaultErrorStyle() {
        errorLabelFont = .init(commonFont: PoppinsFontStyle.regular, size: 12)
        errorLabelColor = Asset.Colors.tomatoRed.color
    }

    func updateStateTo(isError: Bool, error: String? = nil) {
        if isError {
            setErrorState(error: error)
        } else {
            setNormalState()
        }
    }

    private func setErrorState(error: String?) {
        errorview.isHidden = false
        errorIconImageView.isHidden = false
        errorIconImageView.image = errorIcon

        setTextViewBorder(with: Asset.Colors.tomatoRed.color)
        bottomDescriptionLabel.text = error
        bottomDescriptionLabel.isHidden = error?.isBlank ?? true
        inputTextField.placeHolderColor = Asset.Colors.tomatoRed.color
        setupDefaultErrorStyle()
    }

    private func setNormalState() {
        errorview.isHidden = true
        errorIconImageView.isHidden = true
        errorIconImageView.image = UIImage()
        setTextViewBorder(with: Asset.Colors.lightGray.color)

        bottomDescriptionLabel.text = textViewDescription
        bottomDescriptionLabel.isHidden = textViewDescription?.isBlank ?? true
        inputTextField.placeHolderColor = placeholderTextColor
    }

    func setTextViewBorder(with color: UIColor) {
        inputTextField.layer.borderColor = color.cgColor
        inputTextField.layer.borderWidth = 1
        inputTextField.layer.cornerRadius = 4
    }

    @IBAction func textFieldDidChange(_ sender: UITextField) {
        let text = sender.text
        onTextFieldChanged?(text)
    }

    func setupTextFieldGesture() {
        tap = UITapGestureRecognizer(target: self, action: #selector(self.didTapTextField(_:)))
        inputTextField.addGestureRecognizer(tap!)
    }

    func setupTrailingIconStyle() {
        switch trailingIconStyle {
        case .static(let icon):
            textFieldTrailingIconImageView.image = icon
        case .text(let string):
            trailingLabel.text = string
        case .obscure:
            updateTextfieldTrailingIcon(for: trailingIconStyle)
        case .none:
            textFieldTrailingIconImageView.image = nil
        }
    }

    @objc
    func didTapTrailingIcon() {
        if trailingIconStyle.isSecure {
            inputTextField.isSecureTextEntry = !inputTextField.isSecureTextEntry
        }
        setupTrailingIconStyle()
    }

    func updateTextfieldTrailingIcon(for style: TrailingIconStyle) {
        if case let .obscure(icon, secureColor, insecureColor) = style {
            textFieldTrailingIconImageView.image = icon
            textFieldTrailingIconImageView.tintColor = inputTextField.isSecureTextEntry ? secureColor : insecureColor
        }
    }

    func removeTextFieldGesture() {
        guard let tap = tap else {
            return
        }
        inputTextField.removeGestureRecognizer(tap)
    }

    @objc func didTapTextField(_ sender: UITapGestureRecognizer? = nil) {
        onTextFieldTapped?()
    }
}

extension LabelledTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return isEditable
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let formatValidator = formatValidator else { return }
        if textField.text?.isEmpty ?? true {
            setNormalState()
            return
        }
        if formatValidator.isValid(for: inputTextField.text ?? "") {
            setNormalState()
        } else {
            setErrorState(error: formatValidator.invalidFormatError)
        }

        onTextFieldFocusChange?(inputTextField.text)
    }

    enum TrailingIconStyle {
        case `static`(icon: UIImage)
        case text(string: String)
        case obscure(switchIcon: UIImage,
                     secureStateColor: UIColor,
                     insecureStateColor: UIColor)
        case none

        var isSecure: Bool {
            switch self {
            case .obscure: return true
            default: return false
            }
        }
    }
}
