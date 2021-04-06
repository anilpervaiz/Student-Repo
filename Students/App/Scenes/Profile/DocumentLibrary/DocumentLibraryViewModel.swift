//
//  DocumentLibraryViewModel.swift
//  Teachers
//
//  Created by Rahim on 03/04/2021.
//

import Foundation

class DocumentLibraryViewModel {
    private var sections: [SubjectSections] = Subject.mockData.map { SubjectSections(subject: $0, isCollapsed: $0.documents.count > 1) }

    var output: ((Output) -> Void)?

    var numberOfSections: Int {
        sections.count
    }

    func rows(in section: Int) -> Int {
        let isCollapsed = sections[section].isCollapsed
        if isCollapsed {
            return 2
        }
        return sections[section].subject.documents.count
    }

    func totalRows(in section: Int) -> Int {
        sections[section].subject.documents.count
    }

    func document(in indexPath: IndexPath) -> DocumentCellViewModel {
        let document = sections[indexPath.section].subject.documents[indexPath.row]
        return DocumentCellViewModel(document: document, onMoreOptionsTapped: nil)
    }

    func isCollapsed(section: Int, row: Int) -> Bool {
        sections[section].isCollapsed && row >= 1
    }

    func titleForHeader(in section: Int) -> String {
        let subject = sections[section].subject
        return "\(subject.subject) - \(subject.curriculum)"
    }

    func expand(section: Int) {
        sections[section].isCollapsed = false
        output?(.reloadData)
    }

    struct SubjectSections {
        var subject: Subject
        var isCollapsed: Bool
    }

    enum Output {
        case reloadData
    }
}
