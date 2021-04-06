//
//  ChatViewModel.swift
//  Teachers
//

import Foundation
import MessageKit

struct ChatViewModel {
    lazy private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var chatMessages: [Message]
    let currentUser: Sender
    let chatPerson: Sender
    let parentInfo: ParentInfo?
    
    var chatPersonName: String { return chatPerson.displayName }
    var chatPersonImage: UIImage { return chatPerson.displayImage }
    var chatPersonActiveStatus: String { return chatPerson.activeStatus }
    
    init (
        chatMessages: [Message],
        currentUser: Sender,
        chatPerson: Sender,
        parentInfo: ParentInfo? = nil
    ) {
        self.chatMessages = chatMessages
        self.currentUser = currentUser
        self.chatPerson = chatPerson
        self.parentInfo = parentInfo
    }
    
    mutating func showableDateTime(of message: Message) -> String {
        return dateFormatter.string(from: message.sentDate)
    }
}

struct Message: MessageType {
    var sender: SenderType {
        return sentBy
    }
    var messageId: String
    var sentBy: Sender
    var sentDate: Date
    var kind: MessageKind
    
    private init(kind: MessageKind, sentBy: Sender, messageId: String, date: Date) {
        self.kind = kind
        self.sentBy = sentBy
        self.messageId = messageId
        self.sentDate = date
    }

    init(text: String, sentBy: Sender, messageId: String, date: Date) {
        self.init(kind: .text(text), sentBy: sentBy, messageId: messageId, date: date)
    }
}

struct Sender: SenderType, Equatable {
    var senderId: String
    var displayName: String
    var displayImage: UIImage
    var activeStatus: String
}

struct ParentInfo {
    let parentName: String
    let parentImageName: String
}


extension MockData {
    
    static var chatViewModelWithoutParentInfo = ChatViewModel(
        chatMessages: chatMessages ,
        currentUser: currentUser,
        chatPerson: otherUser
    )

    static var chatViewModelWithParentInfo = ChatViewModel(
        chatMessages: chatMessages ,
        currentUser: currentUser,
        chatPerson: otherUser,
        parentInfo: parentInfo
    )

    static var currentUser = Sender(senderId: "000020", displayName: "Steve Deutsch", displayImage: Asset.Media.avatar.image, activeStatus: "")
    
    static var otherUser = Sender(senderId: "000021", displayName: "Jaime Deutsch", displayImage: Asset.Media.avatar.image, activeStatus: "Active Now")
    
    static var parentInfo = ParentInfo(parentName: "Essam Ahmed", parentImageName: Asset.Media.parent.name)
    
    static var chatMessages =  [
        Message(
            text: "Hello Ahmed, can you help teach me about grammar for exams this weekend?",
            sentBy: MockData.currentUser,
            messageId: "",
            date: Date()
        ),
        Message(
            text: "Sure!",
            sentBy: MockData.otherUser,
            messageId: "",
            date: Date()
        ),
        Message(
            text: "I really want to help you anytime",
            sentBy: MockData.otherUser,
            messageId: "",
            date: Date()
        ),
        Message(
            text: "Thank you in advance",
            sentBy: MockData.currentUser,
            messageId: "",
            date: Date()
        ),
        Message(
            text: "I am very difficult to understand grammar in everyday conversations with other people",
            sentBy: MockData.currentUser,
            messageId: "",
            date: Date()
        ),
        Message(
            text: "Ok it's very easy",
            sentBy: MockData.otherUser,
            messageId: "",
            date: Date()
        )]
}

