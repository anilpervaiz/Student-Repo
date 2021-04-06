//
//  ImagePickerOptionSheetViewController.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class ImagePickerOptionSheetViewController: UIViewController {
    @IBOutlet weak var cameraView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(openCamera))
            cameraView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var uploadFileView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(openGallery))
            uploadFileView.addGestureRecognizer(tap)
        }
    }
    @IBOutlet weak var bottomSheetBottomSpacing: NSLayoutConstraint!
    @IBOutlet weak var topDismissLayer: UIView!
    @IBOutlet weak var bottomSheetView: UIView! {
        didSet {
            bottomSheetView.cornerRadius = 8
        }
    }

    var onDismissWithSelection: ((Data?) -> Void)?

    override func viewDidLoad() {
        setupViewGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.animate(withDuration: 1) { [weak self] in
            self?.bottomSheetBottomSpacing.constant = -10
            self?.view.layoutIfNeeded()
        }
    }

    @objc
    func openCamera() {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        controller.allowsEditing = false
        present(controller, animated: true, completion: nil)
    }

    @objc
    func openGallery() {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        controller.allowsEditing = false
        present(controller, animated: true, completion: nil)
    }

    func setupViewGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissView))
        topDismissLayer.addGestureRecognizer(tap)
    }

    @objc
    func dismissView() {
        dismissView(data: nil)
    }

    @objc
    func dismissView(data: Data? = nil) {
        bottomSheetBottomSpacing.constant -= view.frame.height * 0.75
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.onDismissWithSelection?(data)
            self?.dismiss(animated: true, completion: nil)
        }
    }
}

extension ImagePickerOptionSheetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage,
           let imageData = image.jpegData(compressionQuality: 1) {
            dismissView(data: imageData)
        }
    }
}


extension ImagePickerOptionSheetViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .imagePickerBottomSheet }
}
