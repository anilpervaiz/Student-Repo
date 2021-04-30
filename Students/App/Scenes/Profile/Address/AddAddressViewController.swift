//
//  AddAddressViewController.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import UIKit
import GoogleMaps

class AddAddressViewController: BaseViewController {

    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var defaultAddressView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapDefaultAddressCheckbox))
            defaultAddressView.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var defaultAddressCheckbox: UIImageView!
    var isDefaultAddress: Bool = false {
        didSet {
            if isDefaultAddress {
                defaultAddressCheckbox.image = Asset.Media.checkboxSelected.image
                defaultAddressCheckbox.tintColor = Asset.Colors.halfBaked.color
            } else {
                defaultAddressCheckbox.image = Asset.Media.checkbox.image
            }

        }
    }

    @IBOutlet weak var mapView: GMSMapView! {
        didSet {
            mapView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Address"
        // Do any additional setup after loading the view.
        setupKeyboardNotification()
        setupView()
    }

    func setupView() {
        defaultAddressCheckbox.image = isDefaultAddress ? Asset.Media.checkboxSelected.image : Asset.Media.checkbox.image
    }

    @objc
    func didTapDefaultAddressCheckbox() {
        isDefaultAddress = !isDefaultAddress
    }

    @IBAction func didTapSaveAddress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddAddressViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let viewController = SelectLocationViewController.getInstance()
        present(viewController, animated: true, completion: nil)
    }
}

extension AddAddressViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension AddAddressViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            ctaButtonBottomConstraint.constant = keyboardSize.height + AppDimension.margin.medium
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        ctaButtonBottomConstraint.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension AddAddressViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .address }
}
