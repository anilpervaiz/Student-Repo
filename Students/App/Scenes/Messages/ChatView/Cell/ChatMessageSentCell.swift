//
//  ChatMessageSentCell.swift
//  Teachers
//

import Foundation
import UIKit

class ChatMessageSentCell: UITableViewCell, ReusableView {
    @IBOutlet private weak var messageLabel: UILabel!
    
    func configure(text: String) {
        messageLabel.text = text
    }
}
