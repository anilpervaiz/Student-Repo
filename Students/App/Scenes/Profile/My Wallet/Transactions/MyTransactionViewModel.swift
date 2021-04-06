//
//  MyTransactionViewModel.swift
//  Teachers
//
//  Created by Rahim on 02/04/2021.
//

import Foundation

class MyTransactionViewModel {

    var output: ((Output) -> ())?
    private var data: [Transaction] = Transaction.mockData {
        didSet {
            setupData()
        }
    }
    private var sections: [MyTransactionSection] = []

    private var isPastTransactionCollapsed = true
    private var isUpcomingTransactionCollapsed = true

    var numberOfSections: Int {
        sections.count
    }

    init() {
        setupData()
    }

    func setupData() {
        let upcoming = data.filter { $0.date > Date() }
        sections.append(MyTransactionSection(rows: upcoming, title: "Upcoming Transactions", isCollapsed: upcoming.count > 3 ? true : false))

        let past = data.filter { $0.date <= Date() }
        sections.append(MyTransactionSection(rows: past, title: "Previous Transactions", isCollapsed: past.count > 3 ? true : false))
    }

    func titleForHeader(in section: Int) -> String {
        sections[section].title
    }
    
    func numberOfRows(in section: Int) -> Int {
        if sections[section].isCollapsed {
            return 4
        }
        return sections[section].rows.count
    }

    func totalNumberOfRows(in section: Int) -> Int {
        return sections[section].rows.count
    }

    func transaction(at indexPath: IndexPath) -> Transaction? {
        sections[indexPath.section].rows[indexPath.row]
    }

    func isCollapsed(indexPath: IndexPath) -> Bool {
        if sections[indexPath.section].isCollapsed {
            return indexPath.row > 2 ? true : false
        }
        return false
    }

    func didSelectRow(at indexPath: IndexPath) {
        if sections[indexPath.section].isCollapsed && indexPath.row == 3 {
            sections[indexPath.section].isCollapsed = false
            output?(.reloadData)
        }
    }

    func expand(section: Int) {
        sections[section].isCollapsed = false
    }

    enum Output {
        case reloadData
    }

    enum CellType {
        case collapsed(String, String)
        case review(Review)
    }

    struct MyTransactionSection {
        var rows: [Transaction]
        var title: String
        var isCollapsed: Bool
    }
}
