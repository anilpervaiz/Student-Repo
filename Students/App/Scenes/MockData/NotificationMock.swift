//
//  NotificationMock.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct Notification {
    var user: User
    var message: String
    var date: Date
    var status: Status

    lazy var timeString: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }()

    enum Status {
        case new
        case viewed
    }

    static var mockData: [Notification] {
        [
            Notification(user: .mockData,
                         message: "sent you a session request.",
                         date: Date(),
                         status: .new),
            Notification(user: .mockData,
                         message: "sent you a session request.",
                         date: Date(),
                         status: .viewed),
            Notification(user: .mockData,
                         message: "sent you a session request.",
                         date: Date(),
                         status: .viewed),
            Notification(user: .mockData,
                         message: "sent you a session request.",
                         date: Date(),
                         status: .new)
        ]
    }
}
