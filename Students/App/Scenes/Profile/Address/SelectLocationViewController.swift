//
//  SelectLocationViewController.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import UIKit
import GoogleMaps

class SelectLocationViewController: BaseViewController {

    lazy var closeNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.close.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCloseButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    @IBOutlet weak var addressLabel: LabelledTextField! {
        didSet {
            addressLabel.leadingImage = Asset.Media.icSearch.image
            addressLabel.setTextViewBorder(with: .clear)
            addressLabel.textFieldStackView.backgroundColor = Asset.Colors.lightGray.color.withAlphaComponent(0.16)
            addressLabel.onTextFieldChanged = { [weak self] text in
                if text?.isEmpty ?? true {
                    self?.addressLabel.leadingImage = Asset.Media.icSearch.image
                    self?.addressLabel.leadingImageTintColor = Asset.Colors.lightGray.color
                    self?.addressLabel.trailingIconStyle = .none
                } else {
                    self?.addressLabel.leadingImage = Asset.Media.currentLocation.image
                    self?.addressLabel.leadingImageTintColor = Asset.Colors.primary.color
                    self?.addressLabel.trailingIconStyle = .static(icon: Asset.Media.close.image)
                }
            }
            self.addressLabel.didTapTrailingView = {
                self.addressLabel.inputText = ""
            }
        }
    }
    @IBOutlet weak var confirmLocationButton: PrimaryCTAButton!
    @IBOutlet weak var centerLocationButton: UIButton!
    @IBOutlet weak var mapView: GMSMapView! {
        didSet {
            mapView.isMyLocationEnabled = true
            mapView.camera = GMSCameraPosition(latitude: 25.2048, longitude: 55.2708, zoom: 15)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = closeNavigationBarButton
    }

    func moveCameraToMyLocation() {
        guard let myLocationCoordinates = mapView.myLocation?.coordinate else {
            return
        }
        mapView.animate(to: GMSCameraPosition(latitude: myLocationCoordinates.latitude, longitude: myLocationCoordinates.longitude, zoom: 15))
    }

    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapCenterLocationButton(_ sender: Any) {
        moveCameraToMyLocation()
    }

    @IBAction func didTapConfirmLocationButton(_ sender: Any) {
        let viewController = AddAddressViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension SelectLocationViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .address }
}
