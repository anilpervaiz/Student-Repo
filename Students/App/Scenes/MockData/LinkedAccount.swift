//
//  LinkedAccount.swift
//  Students
//
//  Created by Rahim on 25/04/2021.
//

import Foundation

struct LinkedAccount {
    var name: String
    var rating: String
    var profileImage: String

    static var mockData: [LinkedAccount] = {
        return [
            LinkedAccount(name: "Ahmed Mohammed",
                          rating: "4.5",
                          profileImage: Asset.Media.userProfileImage.name),
            LinkedAccount(name: "Sohila Mohammed",
                          rating: "4.5",
                          profileImage: Asset.Media.userProfileImage.name),
        ]
    }()
}
