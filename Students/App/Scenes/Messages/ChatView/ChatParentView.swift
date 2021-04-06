//
//  ChatParentView.swift
//  Teachers
//

import Foundation
import UIKit

class ChatParentView: CustomNibView {
    @IBOutlet weak var parentImageView: UIImageView!
    @IBOutlet weak var parentName: UILabel!
    private var onMessageTapped: (()->()) = {}
    
    func configureWith(parentName: String, parentImage: UIImage, onMessageTapped: @escaping ()->()) {
        self.parentName.text = parentName
        parentImageView.image = parentImage
        self.onMessageTapped = onMessageTapped
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        parentImageView.circular = true
    }
    
    @IBAction func messageButtonTapped(_ sender: Any) {
        onMessageTapped()
    }
}
