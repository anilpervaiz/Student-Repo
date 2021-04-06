//
//  MessageViewModel.swift
//  Teachers
//

import Foundation
import UIKit

struct MessageViewModel {
    let senderImageName: String
    let senderName: String
    let lastMessage: String
    let lastMessageTime: String
    let newMessagesCount: String?
    let senderActiveStatus: UserActiveStatus
}

extension MessageViewModel {
    enum UserActiveStatus: CaseIterable {
        case online
        case offline
        
        func color() -> UIColor {
            switch self {
            case .online:
                return Asset.Colors.successGreen.color
            case .offline:
                return Asset.Colors.lightGray.color
            }
        }
    }
}
