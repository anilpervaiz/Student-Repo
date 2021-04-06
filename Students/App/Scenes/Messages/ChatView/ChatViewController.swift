//
//  ChatViewController.swift
//  Teachers
//

import Foundation
import UIKit
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {
            
    var viewModel: ChatViewModel? = nil
    var bottomConstraint: NSLayoutConstraint?
    var collectionViewHeightConstraint: NSLayoutConstraint?

    lazy private var parentHeaderView: ChatParentView = {
        let chatParentView = ChatParentView().preparedForAutolayout()
        return chatParentView
    }()

    lazy private var dummySender = Sender(senderId: "", displayName: "", displayImage: UIImage(), activeStatus: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupParentView()
        configureMessageCollectionView()
        configureMessageInputBar()
        setupKeyboardNotification()
        let navController = navigationController as? BaseNavigationController
        navController?.applyCustomBackButtonStyle()
        navigationController?.navigationBar.tintColor = Asset.Colors.gray.color
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Asset.Media.moreOptions.image,
            style: .plain,
            target: self,
            action: #selector(moreOptionsTapped)
        )
        setupChatHeader()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        updateCollectionViewSizes(extraHeight: 0)
    }

    private func updateCollectionViewSizes(extraHeight: CGFloat) {
        let collectionViewHeightToBe = UIScreen.main.bounds.height - parentHeaderView.frame.maxY
        if messagesCollectionView.contentSize.height >= collectionViewHeightToBe {
            collectionViewHeightConstraint?.isActive = false
        } else {
            let adjustedInsets = messagesCollectionView.adjustedContentInset.bottom
            collectionViewHeightConstraint?.constant = messagesCollectionView.contentSize.height + adjustedInsets + extraHeight
            collectionViewHeightConstraint?.isActive = true
        }
        messagesCollectionView.layoutIfNeeded()
    }

    private func setupChatHeader() {
        guard let vm = viewModel else { return }
        let chatHeader = ChatHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 48))
        chatHeader.configureFrom(
            chatPersonName: vm.chatPersonName,
            chatPersonImage: vm.chatPersonImage,
            chatPersonActiveStatus: vm.chatPersonActiveStatus
        )

        navigationItem.titleView = chatHeader
    }

    private func setupParentView() {
        let chatParentViewHeight: CGFloat = viewModel?.parentInfo == nil ? 0 : 56
        view.addSubview(parentHeaderView)
        parentHeaderView.fillSuperviewHorizontally()
        NSLayoutConstraint.activate([
            parentHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            parentHeaderView.heightAnchor.constraint(equalToConstant: chatParentViewHeight)
        ])
        parentHeaderView.configureWith(
            parentName: viewModel?.parentInfo?.parentName ?? "",
            parentImage: UIImage(named: viewModel?.parentInfo?.parentImageName ?? "") ?? UIImage(),
            onMessageTapped: {
            print("Message to parent tapped")
        })

        let topConstraint = messagesCollectionView.getConstraints(attribute: .top)
        topConstraint.first?.isActive = false

        bottomConstraint = messagesCollectionView.getConstraints(attribute: .bottom).first
        messagesCollectionView.topAnchor.constraint(greaterThanOrEqualTo: parentHeaderView.bottomAnchor).isActive = true
        collectionViewHeightConstraint = messagesCollectionView.heightAnchor.constraint(equalToConstant: 0)
        collectionViewHeightConstraint?.isActive = false
    }
    
    private func configureMessageCollectionView() {
        let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout
        layout?.sectionInset = UIEdgeInsets(top: 1, left: 12, bottom: 1, right: 12)
        
        layout?.setMessageOutgoingAvatarSize(.zero)
        layout?.setMessageIncomingAvatarSize(.zero)
        layout?.setMessageOutgoingMessageBottomLabelAlignment(
            LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 4))
        )
        layout?.setMessageIncomingMessageBottomLabelAlignment(
            LabelAlignment(textAlignment: .left, textInsets: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0))
        )

        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messageCellDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        scrollsToLastItemOnKeyboardBeginsEditing = true // default false
        //maintainPositionOnKeyboardFrameChanged = true // default false

        //showMessageTimestampOnSwipeLeft = true // default false
  //      messagesCollectionView.refreshControl = refreshControl
    }
    
    private func configureMessageInputBar() {
        //messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = Asset.Colors.halfBaked.color
        
        messageInputBar.inputTextView.backgroundColor = Asset.Colors.lightGray.color.withAlphaComponent(0.16)

        messageInputBar.inputTextView.textContainerInset = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        messageInputBar.padding = UIEdgeInsets(top: 15, left: 16, bottom: 15, right: 16)
        
        messageInputBar.inputTextView.placeholderTextColor = Asset.Colors.gray.color
        messageInputBar.inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 36)

        //messageInputBar.inputTextView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        //messageInputBar.inputTextView.layer.borderWidth = 1.0
        messageInputBar.inputTextView.layer.cornerRadius = 18.0
        messageInputBar.inputTextView.layer.masksToBounds = true
        //messageInputBar.middleContentViewPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        messageInputBar.delegate = self

        configureInputBarItems()
    }
    
    private func configureInputBarItems() {
        //messageInputBar.sendButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        //messageInputBar.sendButton.setSize(CGSize(width: 24, height: 24), animated: false)
        messageInputBar.sendButton.image = Asset.Media.send.image
        messageInputBar.sendButton.title = nil
    }

    @objc
    func moreOptionsTapped() {
        print("more options button Tapped")
    }
}

// MARK: - Helpers

extension ChatViewController {
    func isNextMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard let vm = viewModel else { return false }
        let messageList = vm.chatMessages
        guard indexPath.section + 1 < messageList.count else { return false }
        return messageList[indexPath.section].sentBy == messageList[indexPath.section + 1].sentBy
    }

    func isPreviousMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard let vm = viewModel else { return false }
        let messageList = vm.chatMessages
        let previousIndex = indexPath.section - 1
        guard previousIndex >= 0, previousIndex < messageList.count else { return false }
        return messageList[indexPath.section].sentBy == messageList[previousIndex].sentBy
    }

    func currentSender() -> SenderType {
        viewModel?.currentUser ?? dummySender
    }
    
    func insertMessage(_ message: Message) {
        viewModel?.chatMessages.append(message)
        guard let msgCount = viewModel?.chatMessages.count else { return }
        // Reload last section to update header/footer labels and insert a new one
        messagesCollectionView.performBatchUpdates({
            messagesCollectionView.insertSections([msgCount - 1])
            if msgCount >= 2 {
                messagesCollectionView.reloadSections([msgCount - 2])
            }
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            self.updateCollectionViewSizes(extraHeight: 0)
            self.messagesCollectionView.scrollToLastItem(animated: true)
        })
    }
}

// MARK: - MessagesDataSource

extension ChatViewController: MessagesDataSource {
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        viewModel?.chatMessages.count ?? 0
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        var msg = viewModel?.chatMessages[indexPath.section] ?? Message(text: "", sentBy: MockData.currentUser, messageId: "", date: Date())
        
        if case MessageKind.text(let value) = msg.kind {
            let attributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.regular.name, size: 14.0) as Any,
                NSAttributedString.Key.foregroundColor : isFromCurrentSender(message: msg) ? Asset.Colors.pureWhite.color : Asset.Colors.darkBlue.color
                ]
            msg.kind = MessageKind.attributedText(NSAttributedString(string: value, attributes: attributes))
        }
        return msg
    }
    
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        if !isNextMessageSameSender(at: indexPath),
           let message = message as? Message {
            return NSAttributedString(
                string: viewModel?.showableDateTime(of: message) ?? "",
                attributes: [
                    NSAttributedString.Key.font: UIFont(name: PoppinsFontStyle.regular.name, size: 10.0) as Any,
                    NSAttributedString.Key.foregroundColor: Asset.Colors.captionGray.color
                ])
        }
        return nil
    }
}

// MARK: - MessagesLayoutDelegate
extension ChatViewController: MessagesLayoutDelegate {
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return !isNextMessageSameSender(at: indexPath) ? 16 : 0
    }
}

// MARK: - MessagesDisplayDelegate
extension ChatViewController: MessagesDisplayDelegate {
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? Asset.Colors.halfBaked.color : Asset.Colors.disableGray.color
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        if isNextMessageSameSender(at: indexPath) {
            return .bubble
        } else {
            let tail: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
            return .bubbleTail(tail, .curved)
        }
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true
    }
}

// MARK: - MessageInputBarDelegate

extension ChatViewController: InputBarAccessoryViewDelegate {

    @objc
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        processInputBar(messageInputBar)
    }

    func processInputBar(_ inputBar: InputBarAccessoryView) {
        let components = inputBar.inputTextView.components
        inputBar.inputTextView.text = String()
        inputBar.invalidatePlugins()
        // Send button activity animation
        //inputBar.sendButton.startAnimating()
        inputBar.inputTextView.placeholder = "Sending..."
        // Resign first responder for iPad split view
        inputBar.inputTextView.resignFirstResponder()
        DispatchQueue.global(qos: .default).async {
            // fake send request task
            //sleep(1)
            DispatchQueue.main.async { [weak self] in
                //inputBar.sendButton.stopAnimating()
                inputBar.inputTextView.placeholder = "Aa"
                self?.insertMessages(components)
                self?.messagesCollectionView.scrollToLastItem(animated: true)
            }
        }
    }

    private func insertMessages(_ data: [Any]) {
        guard let vm = viewModel else { return }
        for component in data {
            let user = vm.currentUser
            if let str = component as? String {
                let message = Message(text: str, sentBy: user, messageId: UUID().uuidString, date: Date())
                insertMessage(message)
            }
        }
    }
}


extension ChatViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension ChatViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            updateCollectionViewSizes(extraHeight: keyboardSize.height)
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        updateCollectionViewSizes(extraHeight: 0)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ChatViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .message }
}

