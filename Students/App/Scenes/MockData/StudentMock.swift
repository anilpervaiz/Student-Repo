//
//  StudentMock.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct Student {
    var parent: User
    var rating: Double
    var name: String
    var learningHours: Int = 100
    var sessionCount: Int = 30
    var profileImage: String // For the sake of UI, considering it as asset image atm.

    static var mockData: [Student] {
        [
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name),
            Student(parent: .mockData,
                    rating: 4.5,
                    name: "Assem Mohammed",
                    profileImage: Asset.Media.userProfileImage.name)
        ]
    }
}
