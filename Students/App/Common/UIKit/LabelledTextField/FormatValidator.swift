//
//  FormatValidator.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import Foundation

protocol FormatValidatorType {
    var regex: String { get }
    var invalidFormatError: String { get }

    func isValid(for string: String) -> Bool
}

struct FormatValidator: FormatValidatorType {
    var regex: String
    var invalidFormatError: String

    func isValid(for string: String) -> Bool {
        return string.isValid(for: regex)
    }
}
