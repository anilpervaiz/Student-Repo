//
//  Collection+Extensions.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}
