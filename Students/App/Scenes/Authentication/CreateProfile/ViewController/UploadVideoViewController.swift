//
//  UploadVideoViewController.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit
import MobileCoreServices

class UploadVideoViewController: BaseViewController {

    var onDismissWithSelection: ((Data?) -> Void)?
    @IBOutlet weak var uploadVideoView: UIView! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapUploadVideo))
            uploadVideoView.addGestureRecognizer(gesture)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .default
    }

    @IBAction func didTapRecordVideoButton(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .camera
        controller.mediaTypes = [kUTTypeMovie as String]
        present(controller, animated: true, completion: nil)
    }

    @objc
    func didTapUploadVideo() {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        controller.mediaTypes = [kUTTypeMovie as String]
        present(controller, animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        uploadVideoView.addDashedBorder(color: Asset.Colors.primary.color.cgColor)
    }

    @IBAction func didTapDoneButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UploadVideoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedVideo:URL = (info[UIImagePickerController.InfoKey.mediaURL] as? URL) {
            // Save video to the main photo album
            let selectorToCall = #selector(videoSaved(_:didFinishSavingWithError:context:))
            UISaveVideoAtPathToSavedPhotosAlbum(selectedVideo.relativePath, self, selectorToCall, nil)

            let videoData = try? Data(contentsOf: selectedVideo)

            // Here's the video that can be used.
        }
        // 3
        picker.dismiss(animated: true)
    }

    @objc func videoSaved(_ video: String, didFinishSavingWithError error: NSError!, context: UnsafeMutableRawPointer){
        if let theError = error {
            print("error saving the video = \(theError)")
        } else {
           DispatchQueue.main.async(execute: { () -> Void in
           })
        }
    }
}

extension UploadVideoViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
