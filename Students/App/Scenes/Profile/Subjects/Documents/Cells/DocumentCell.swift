//
//  DocumentCell.swift
//  Teachers

import Foundation
import UIKit

class DocumentCell: UITableViewCell, ReusableView {
    @IBOutlet weak var docThumbnailImageView: UIImageView!    
    @IBOutlet weak var docNameLabel: UILabel!
    @IBOutlet weak var docSizeAndDateLabel: UILabel!
    
    private var onMoreOptionsTapped: (()->())? = nil
    
    func configure(with viewModel: DocumentCellViewModel) {
        docThumbnailImageView.image = viewModel.thumbnail
        docNameLabel.text = viewModel.document.name
        docSizeAndDateLabel.text = viewModel.formattedDescription
        self.onMoreOptionsTapped = viewModel.onMoreOptionsTapped
    }
    
    @IBAction func moreOptionsTapped(_ sender: Any) {
        onMoreOptionsTapped?()
    }
}

struct DocumentCellViewModel {
    var document: Document
    let onMoreOptionsTapped: (()->())?

    var formattedDescription: String { "\(document.size) • \(document.formattedDate)" }
    var thumbnail: UIImage { document.type.image() }
}

enum DocumentType {
    case doc
    case jpg
    case mp4
    case pdf
    case zip
    
    func image() -> UIImage {
        switch self {
        case .doc:
            return Asset.Media.doc.image
        case .jpg:
            return Asset.Media.jpg.image
        case .mp4:
            return Asset.Media.mp4.image
        case .pdf:
            return Asset.Media.pdf.image
        case .zip:
            return Asset.Media.zip.image
        }
    }
}
