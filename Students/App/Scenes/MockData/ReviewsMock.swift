//
//  ReviewsMock.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct User {
    var name: String
    var profileImage: String // For the sake of UI, considering it as asset image atm.
    var rating: Double
    
    static var mockData: User {
        User(name: "Ahmed Mohammed",
             profileImage: Asset.Media.userProfileImage.name,
             rating: 4.5)
    }
}

struct Teacher {
    var name: String
    var profileImage: String
    var rating: Double
    var tutoredHour: Int
    var students: Int
    var sessionCount: Int
    var subjects: [Subject]

    var formattedSubjects: String {
        subjects.map { $0.subject }.joined(separator: " ,")
    }

    static var mockData: Teacher = .init(name: "Ahmed Mohammed",
                                         profileImage: Asset.Media.userProfileImage.name,
                                         rating: 4.5,
                                         tutoredHour: 130,
                                         students: 4,
                                         sessionCount: 10,
                                         subjects: Subject.mockData)
}

struct Review {
    var reviewedBy: User
    var rating: Int
    var review: String
    var reviewTime: Date

    static var mockData: [Review] {
        return [
            Review(reviewedBy: .mockData,
                   rating: 4,
                   review: "Ahmed is really professional at English teaching. my daughter and I both have her English lesson. she prepare the lesson in advance and expand the knowledge.",
                   reviewTime: Date()),
            Review(reviewedBy: .mockData,
                   rating: 4,
                   review: "Ahmed is really professional at English teaching. my daughter and I both have her English lesson. she prepare the lesson in advance and expand the knowledge.",
                   reviewTime: Date()),
            Review(reviewedBy: .mockData,
                   rating: 4,
                   review: "Ahmed is really professional at English teaching. my daughter and I both have her English lesson. she prepare the lesson in advance and expand the knowledge.",
                   reviewTime: Date()),
            Review(reviewedBy: .mockData,
                   rating: 4,
                   review: "Ahmed is really professional at English teaching. my daughter and I both have her English lesson. she prepare the lesson in advance and expand the knowledge.",
                   reviewTime: Date())
        ]
    }
}

