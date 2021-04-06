//
//  SubjectDetailsViewModel.swift
//  Teachers
//

import Foundation

protocol SubjectDetailTableCellViewModel {}

class SubjectDetailsViewModel {
    lazy var studentParentDetailsViewModel: StudentParentDetailsTableViewCellViewModel = {
        StudentParentDetailsTableViewCellViewModel(
            studentImage: Asset.Media.student.image,
            studentName: "Assem Mohammed",
            parentImage: Asset.Media.studentParent.image,
            ratingImage: Asset.Media.ratingStar.image,
            rating: "4.5") { [weak self] in
            self?.router.navigateToChatView()
        }
    }()
    lazy var subjectDetailTableViewModel: SubjectDetailTableViewCellViewModel = {
        SubjectDetailTableViewCellViewModel(
            subjectThumbnailImage: Asset.Media.subject.image, subjectName: "History", subjectDetail: "American Curriculum - Grade 6")
    }()
    lazy var dateAndTimeTableViewModel: DateAndTimeTableViewCellViewModel = {
        DateAndTimeTableViewCellViewModel(
            timeImage: Asset.Media.time.image,
            date: "Monday, 4 Feb",
            time: "2:30 PM - 01:30 PM (1 hour)",
            lectureModeImage: Asset.Media.lectureMode.image
        )
    }()
    lazy var paymentMethodTableViewModel: PaymentMethodTableViewCellViewModel = {
        PaymentMethodTableViewCellViewModel(
            paymentMethodImage: Asset.Media.applePay.image,
            paymentMethod: "Apple Pay"
        )
    }()
    lazy var sessionFeesViewModel: SessionFeesTableViewCellViewModel = {
        SessionFeesTableViewCellViewModel(hoursValue: "2 Hours", totalValue: "AED 80")
    }()
    private let router: SubjectRouter
    
    init(router: SubjectRouter) {
        self.router = router
    }
    
    lazy private(set) var cells: [CellType] = [.studentParent, .rateStudent, .subject, .dateAndTime, .paymentMethod, .sessionFees]
    var numberOfCells: Int { cells.count }
    
    func cell(at index: Int) -> CellType? {
        guard index >= 0, index < numberOfCells else { return nil}
        return cells[index]
    }
    
    func didSelectCell(at index: Int) {
        switch CellType(rawValue: index) {
        case .rateStudent: router.navigateToWriteAReview()
        default: break
        }
    }
    
    enum CellType: Int {
        case studentParent = 0
        case rateStudent
        case subject
        case dateAndTime
        case paymentMethod
        case sessionFees
    }
}
