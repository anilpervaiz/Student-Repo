//
//  String+Regex.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import Foundation

extension String {
    func isValid(for regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
