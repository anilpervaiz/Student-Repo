//
//  CategorizedWishlistViewModel.swift
//  Students
//
//  Created by Rahim on 10/04/2021.
//

import Foundation

class CategorizedWishlistViewModel {
    var sections: [WishlistCategorySection] = []
    var output: ((Output) -> Void)?

    var numberOfSection: Int {
        sections.count
    }

    init() {
        setupData()
    }

    func header(in section: Int) -> String {
        sections[section].title
    }

    func totalNumberOfRows(in section: Int) -> Int {
        sections[section].wishlists.count
    }

    func setupData() {
        let data = WishList.mockData
        let uniqueSubjects = data.map { $0.subject }.unique()
        for subject in uniqueSubjects {
            let wishlist = data.filter { $0.subject == subject }
            sections.append(WishlistCategorySection(wishlists: wishlist,
                                                    title: subject.identifier))
        }
    }

    func numberOfRows(in section: Int) -> Int {
        if sections[section].isCollapsed {
            return 2
        } else {
            return sections[section].wishlists.count
        }
    }

    func wishlist(for indexPath: IndexPath) -> WishList {
        sections[indexPath.section].wishlists[indexPath.row]
    }

    func isCollapsedRow(at indexPath: IndexPath) -> Bool {
        sections[indexPath.section].isCollapsed && indexPath.row > 0
    }

    func didSelectRow(at indexPath: IndexPath) {
        if isCollapsedRow(at: indexPath) {
            didExpandSection(at: indexPath)
        }
    }

    func didExpandSection(at indexPath: IndexPath) {
        sections[indexPath.section].isCollapsed = false
        output?(.reloadData)
    }

    struct WishlistCategorySection {
        var wishlists: [WishList]
        var title: String
        var isCollapsed: Bool

        init(wishlists: [WishList],
             title: String) {
            self.wishlists = wishlists
            self.title = title
            self.isCollapsed = wishlists.count > 1
        }
    }

    enum Output {
        case reloadData
    }
}
