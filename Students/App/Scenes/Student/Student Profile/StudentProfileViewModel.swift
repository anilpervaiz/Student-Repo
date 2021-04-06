//
//  StudentProfileViewModel.swift
//  Teachers
//
//  Created by Rahim on 26/03/2021.
//

import Foundation

class StudentProfileViewModel {
    var output: ((Output) -> ())?
    var student: Student = Student.mockData.first!
    var sessions: [Session] = Session.mockData
    var reviews: [Review] = Review.mockData

    private let router: StudentProfileRouter

    var sessionSectionState: SectionState = .collapsed
    var reviewSectionState: SectionState = .collapsed


    init(router: StudentProfileRouter) {
        self.router = router
    }

    func setupData() {
        if sessions.count > 1 {
            sessionSectionState = .collapsed
        } else {
            sessionSectionState = .expanded
        }
        if sessions.count > 1 {
            reviewSectionState = .collapsed
        } else {
            reviewSectionState = .expanded
        }
    }

    func didTapCellForRow(at indexPath: IndexPath) {
        switch indexPath.section {
        case Section.writeAReview.rawValue: router.navigateToWriteAReview()
        case Section.parent.rawValue:
            router.navigateToChat(showsParentInfo: false)
        case Section.session.rawValue:
            if sessionSectionState == .collapsed && indexPath.row == 1 {
                sessionSectionState = .expanded
                output?(.reloadData)
            }
        case Section.review.rawValue:
            if reviewSectionState == .collapsed && indexPath.row == 1 {
                reviewSectionState = .expanded
                output?(.reloadData)
            }
        default: break
        }
    }

    func didTapChatWithStudentButton() {
        router.navigateToChat(showsParentInfo: true)
    }

    func numberOfRows(for section: Int) -> Int {
        switch section {
        case Section.writeAReview.rawValue: return 1
        case Section.parent.rawValue: return 1
        case Section.session.rawValue: return sessionSectionState == .collapsed ? 2 : sessions.count
        case Section.review.rawValue: return reviewSectionState == .collapsed ? 2 : reviews.count
        default: return 0
        }
    }

    func headerDetails(for section: Int) -> (String, String)? {
        switch section {
        case Section.session.rawValue: return ("Sessions", " (\(sessions.count))")
        case Section.review.rawValue: return ("Reviews", " (\(reviews.count))")
        default: return nil
        }
    }

    func cellType(for indexPath: IndexPath) -> CellType? {
        switch indexPath.section {
        case Section.writeAReview.rawValue: return .writeAReview
        case Section.parent.rawValue: return .parent(student.parent)
        case Section.session.rawValue:
            if sessionSectionState == .collapsed && indexPath.row == 1 {
                return .collapsed("\(sessions.count) More Sessions")
            } else {
                return .session(sessions[indexPath.row])
            }
        case Section.review.rawValue:
            if reviewSectionState == .collapsed && indexPath.row == 1 {
                return .collapsed("\(reviews.count) More Reviews")
            } else {
                return .review(reviews[indexPath.row])
            }
        default: return nil
        }
    }

    enum Output {
        case reloadData
    }

    enum SectionState {
        case expanded
        case collapsed
    }

    enum Section: Int, CaseIterable {
        case writeAReview
        case parent
        case session
        case review
    }

    enum CellType {
        case writeAReview
        case parent(User)
        case session(Session)
        case collapsed(String)
        case review(Review)
    }
}
