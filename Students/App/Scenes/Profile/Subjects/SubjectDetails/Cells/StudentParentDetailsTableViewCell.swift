//
//  StudentParentDetailsTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class PersonDetailsTableViewCell: UITableViewCell,
                                  ReusableView {
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var personDetailContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    private var onChatButtonTapped: (()->())? = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
        personImageView.circular = true
    }
    
    func configure(with viewModel: PersonDetailsTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        personImageView.image = viewModel.personImage
        personNameLabel.text = viewModel.personName
        ratingImageView.image = viewModel.ratingImage
        ratingLabel.text = viewModel.rating
        self.onChatButtonTapped = viewModel.onChatButtonTapped
    }

    @IBAction func chatButtonTapped(_ sender: Any) {
        onChatButtonTapped?()
    }
}

struct PersonDetailsTableViewCellViewModel: SubjectDetailTableCellViewModel,
                                            TableCellViewModel {
    let title: String
    let personImage: UIImage
    let personName: String
    let ratingImage: UIImage
    let rating: String
    let onChatButtonTapped: (()->())?

    init(title: String,
         personImage: UIImage,
         personName: String,
         ratingImage: UIImage,
         rating: String,
         onChatButtonTapped: (()->())? = nil) {

        self.title = title
        self.personImage = personImage
        self.personName = personName
        self.ratingImage = ratingImage
        self.rating = rating
        self.onChatButtonTapped = onChatButtonTapped
    }
}
