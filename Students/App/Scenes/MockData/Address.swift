//
//  Address.swift
//  Students
//
//  Created by Rahim on 08/04/2021.
//

import Foundation

struct Address {
    var title: String
    var address: String
    var building: String
    var floor: String
    var flat: String
    var isDefault: Bool

    var description: String {
        "Building \(building) • Floor \(floor) • Flat \(flat)"
    }

    static var mockData: [Address] {
        [
            Address(title: "Home", address: "Dubai - United Arab Emirates", building: "20", floor: "2", flat: "10", isDefault: true),
            Address(title: "Home", address: "Dubai - United Arab Emirates", building: "20", floor: "2", flat: "10", isDefault: false),
            Address(title: "Home", address: "Dubai - UAE", building: "20", floor: "2", flat: "10", isDefault: false),
            Address(title: "Home", address: "Dubai - United Arab Emirates", building: "20", floor: "2", flat: "10", isDefault: false)
        ]
    }
}
