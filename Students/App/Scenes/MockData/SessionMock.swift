//
//  SessionMock.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct Session {
    var subject: String
    var curriculum: String
    var user: User
    var date: Date
    var medium: Medium
    var state: State

    var isUpcoming: Bool {
        date > Date()
    }

    lazy var sessionDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E d MMM, h:mm a"

        return dateFormatter.string(from: date)
    }()

    static var requestedSessionMockData: [Session] { mockData.filter { $0.state == .requested } }


    static var mockData: [Session] {
        [
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .requested),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .inPerson,
                    state: .requested),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .requested),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date(),
                    medium: .online,
                    state: .requested),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date().addingTimeInterval(86400),
                    medium: .online,
                    state: .accepted),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date().addingTimeInterval(86400),
                    medium: .inPerson,
                    state: .accepted),
            Session(subject: "Math",
                    curriculum: "American Curriculum",
                    user: .mockData,
                    date: Date().addingTimeInterval(86400),
                    medium: .online,
                    state: .accepted)
        ]
    }

    enum State {
        case requested
        case accepted
        case rejected
        case started
        case ended

        var title: String {
            switch self {
            case .requested: return "Request Details"
            default: return "Session Details"
            }
        }
    }

    enum Medium {
        case online
        case inPerson

        var themeColor: ColorAsset {
            switch self {
            case .online: return Asset.Colors.blue
            case .inPerson: return Asset.Colors.purple
            }
        }

        var title: String {
            switch self {
            case .online: return "Online"
            case .inPerson: return "In-Person"
            }
        }

        var icon: ImageAsset {
            switch self {
            case .online: return Asset.Media.sessionTypeOnline
            case .inPerson: return Asset.Media.inpersonIcon
            }
        }
    }

}

