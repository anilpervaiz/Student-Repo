//
//  SubjectMainViewModel.swift
//  Teachers
//

import Foundation

struct SubjectMainViewModel {
    private let router: SubjectRouter
    let subjectName: String
    let subjectDetail: String
    let subjectDetalsViewModel: SubjectDetailsViewModel
    let subjectDocumentsViewModel: DocumentsViewModel
    
    init(with router: SubjectRouter,
         subjectName: String,
         subjectDetail: String,
         subjectDetalsViewModel: SubjectDetailsViewModel,
         subjectDocumentsViewModel: DocumentsViewModel
    ) {
        self.router = router
        self.subjectName = subjectName
        self.subjectDetail = subjectDetail
        self.subjectDetalsViewModel = subjectDetalsViewModel
        self.subjectDocumentsViewModel = subjectDocumentsViewModel
    }
}
