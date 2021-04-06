//
//  MessageCell.swift
//  Teachers
//

import Foundation
import UIKit

class MessageCell: UITableViewCell, ReusableView {
    
    @IBOutlet private weak var senderImage: UIImageView!
    @IBOutlet private weak var senderName: UILabel!
    @IBOutlet private weak var lastMessage: UILabel!
    @IBOutlet private weak var lastMessageTime: UILabel!
    @IBOutlet private weak var newMessagesCount: UILabel!
    @IBOutlet private weak var newMessagesBackgroundView: UIView!
    @IBOutlet private weak var senderActiveStatusView: UIView!
    
    private(set) var viewModel: MessageViewModel?
    private var hasNewMessages: Bool {
        guard let newMessagesCount = viewModel?.newMessagesCount,
           !newMessagesCount.isEmpty else {
            return false
        }
        return true
    }
    
    lazy private var newMessageStyle: MessageTextStyle = {
        return MessageTextStyle(
            font: .init( commonFont: PoppinsFontStyle.medium, size: 14),
            color: Asset.Colors.darkBlue.color
        )
    }()
    
    lazy private var oldMessageStyle: MessageTextStyle = {
        return MessageTextStyle(
            font: .init( commonFont: PoppinsFontStyle.regular, size: 14),
            color: Asset.Colors.gray.color
        )
    }()
    
    func configure(from messageVM: MessageViewModel) {
        viewModel = messageVM
        if !messageVM.senderImageName.isEmpty {
            senderImage.image = UIImage(named: messageVM.senderImageName)
        }
        senderName.text = messageVM.senderName
        lastMessage.text = messageVM.lastMessage
        lastMessageTime.text = messageVM.lastMessageTime
        newMessagesCount.text = messageVM.newMessagesCount
        
        let messageStyle = hasNewMessages ? newMessageStyle : oldMessageStyle
        lastMessage.font = messageStyle.font
        lastMessage.textColor = messageStyle.color        
        senderActiveStatusView.backgroundColor = messageVM.senderActiveStatus.color()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        senderImage.circular = true
        senderActiveStatusView.circular = true
        let hasNewMessages = self.hasNewMessages
        newMessagesBackgroundView.circular = hasNewMessages
        newMessagesBackgroundView.isHidden = !hasNewMessages
    }
}

extension MessageCell {
    struct MessageTextStyle {
        let font: UIFont
        let color: UIColor
    }
}
