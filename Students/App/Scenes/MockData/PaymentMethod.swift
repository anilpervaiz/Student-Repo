//
//  PaymentMethod.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

struct PaymentMethod {
    var type: PaymentType
    var cardNumber: String
    var expiryDate: Date
    var holderName: String
    var isDefault: Bool

    var formattedExpiryDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        return "EXP: \(dateFormatter.string(from: expiryDate))"
    }

    static var mockData: [PaymentMethod] = {
        [
            PaymentMethod(type: .mastercard, cardNumber: "**** **** **** 9201", expiryDate: Date(), holderName: "test", isDefault: true),
            PaymentMethod(type: .visa, cardNumber: "**** **** **** 9201", expiryDate: Date(), holderName: "test", isDefault: false),
        ]
    }()

    enum PaymentType {
        case mastercard
        case visa

        var title: String {
            switch self {
            case .mastercard: return "MasterCard"
            case .visa: return "Visa"
            }
        }

        var icon: ImageAsset {
            switch self {
            case .mastercard: return Asset.Media.mastercard
            case .visa: return Asset.Media.visa
            }
        }
    }
}
