//
//  SubjectBuilder.swift
//  Teachers
//

import Foundation

struct SubjectMainViewBuilder {
    func makeViewController(navigationController: BaseNavigationController?) -> SubjectMainViewController {
        let viewController = SubjectMainViewController.getInstance()
        let router = SubjectRouter(with: navigationController)
        let subjectDetailsViewModel = SubjectDetailsViewModel(
            router: router
        )

        let documentsViewModel = DocumentsViewModel(router: router, documents: Subject.mockData.first?.documents ?? [])
        
        viewController.viewModel = SubjectMainViewModel(with: router,
                                                        subjectName: "Math",
                                                        subjectDetail: "American Curriculum",
                                                        subjectDetalsViewModel: subjectDetailsViewModel,
                                                        subjectDocumentsViewModel: documentsViewModel
        )

        return viewController
    }
}
