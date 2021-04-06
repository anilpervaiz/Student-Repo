//
//  ChatHeaderView.swift
//  Teachers
//

import Foundation
import UIKit

class ChatHeaderView: CustomNibView {
    
    @IBOutlet weak var chatPersonImage: UIImageView!
    @IBOutlet weak var chatPersonName: UILabel!
    @IBOutlet weak var chatPersonActiveStatus: UILabel!
    
    func configureFrom(chatPersonName: String, chatPersonImage: UIImage, chatPersonActiveStatus: String) {
        self.chatPersonName.text = chatPersonName
        self.chatPersonImage.image = chatPersonImage
        self.chatPersonActiveStatus.text = chatPersonActiveStatus
    }
}
