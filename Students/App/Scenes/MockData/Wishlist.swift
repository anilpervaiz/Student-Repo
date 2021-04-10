//
//  Wishlist.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

struct WishList {

    var amount: Double
    var teacher: Teacher
    var subject: Subject

    var formattedAmount: String {
        "\(amount) AED/h"
    }

    static var mockData: [WishList] = {
        [
            WishList(amount: 50,
                     teacher: .mockData,
                     subject: Subject.mockData[0]),
            WishList(amount: 50,
                     teacher: .mockData,
                     subject: Subject.mockData[1]),
            WishList(amount: 50,
                     teacher: .mockData,
                     subject: Subject.mockData[2]),
            WishList(amount: 50,
                     teacher: .mockData,
                     subject: Subject.mockData[1]),
            WishList(amount: 50,
                     teacher: .mockData,
                     subject: Subject.mockData[2])
        ]
    }()
}
