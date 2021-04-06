//
//  ChatMessageReceivedCell.swift
//  Teachers
//

import Foundation
import UIKit

class ChatMessageReceivedCell: UITableViewCell, ReusableView {
    @IBOutlet private weak var messageLabel: UILabel!

    func configure(text: String) {
        messageLabel.text = text
    }
}

