//
//  Transaction.swift
//  Teachers
//
//  Created by Rahim on 02/04/2021.
//

import Foundation

struct Transaction {
    var destinationAccount: String
    var date: Date
    var amount: Double
    var type: TransactionType
    var usedBy: LinkedAccount

    var formattedType: String {
        type.rawValue
    }

    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }

    enum TransactionType: String {
        case online = "Online Transaction"
    }

    static var mockData = [
        Transaction(destinationAccount: "**** **** **** 9201", date: Date(), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date(), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date(), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date(), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date(), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date(), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date().addingTimeInterval(86400), amount: 800, type: .online, usedBy: .mockData[0]),
        Transaction(destinationAccount: "**** **** **** 9201", date: Date().addingTimeInterval(86400), amount: 800, type: .online, usedBy: .mockData[0]),
    ]
}
