//
//  MyEarningsViewModel.swift
//  Teachers
//
//  Created by Rahim on 02/04/2021.
//

import Foundation

class MyEarningsViewModel {

    var section: [Section] = [
        Section(row: [
            Section.Row(title: "Total Teaching Hours", description: "102"),
            Section.Row(title: "Total Sessions", description: "25"),
            Section.Row(title: "Total Tutored Students", description: "25"),
            Section.Row(title: "Recurrent Student", description: "22")
        ], title: "Details"),
        Section(row: [
            Section.Row(title: "Math - American Curriculum", description: "AED 800"),
            Section.Row(title: "Physics - British Curriculum", description: "AED 800"),
            Section.Row(title: "History - British Curriculum", description: "AED 800"),
        ], title: "Total Earning per subject")
    ]
    
    var numberOfSection: Int {
        section.count
    }

    func numberOfRows(in sectionIndex: Int) -> Int {
        section[sectionIndex].row.count
    }

    func row(at indexPath: IndexPath) -> Section.Row {
        section[indexPath.section].row[indexPath.row]
    }

    struct Section {
        var row: [Row]
        var title: String

        struct Row {
            var title: String
            var description: String
        }
    }
}
