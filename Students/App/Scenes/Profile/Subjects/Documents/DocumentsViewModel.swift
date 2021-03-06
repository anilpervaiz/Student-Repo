//
//  DocumentsViewModel.swift
//  Teachers
//

import Foundation

struct DocumentsViewModel {
    private let router: SubjectRouter
    let documents: [DocumentCellViewModel]
    var numberOfItems: Int { documents.count }

    init(router: SubjectRouter,
         documents: [Document]) {
        self.router = router
        self.documents = documents.map {
            DocumentCellViewModel(document: $0,
                                  onMoreOptionsTapped: nil)
        }
    }
    
    func documentViewModel(at index: Int) -> DocumentCellViewModel? {
        guard index >= 0, index < documents.count else { return nil }
        return documents[index]
    }

    func didTapRow(at index: Int) {
        
    }
}
