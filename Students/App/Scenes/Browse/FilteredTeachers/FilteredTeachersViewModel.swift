//
//  FilteredTeachersViewModel.swift
//  Students
//
//  Created by Rahim on 11/04/2021.
//

import Foundation

class FilteredTeachersViewModel {
    var filters: [String] = ["American Curriculum", "Grade 6", "English 6"]
    var teachers = WishList.mockData
    var output: ((Output) -> ())?
    var router: TeacherListingRouter

    var numberOfFilters: Int {
        filters.count
    }

    var numberOfTeachers: Int {
        teachers.count
    }

    init(router: TeacherListingRouter) {
        self.router = router
    }

    func filter(at index: Int) -> String {
        filters[index]
    }

    func teacher(at index: Int) -> WishList {
        teachers[index]
    }

    func didSelectTeacher(at index: Int) {
        router.navigateToTeacherProfile()
    }

    func didRemoveFilter(at index: Int) {
        filters.remove(at: index)
        output?(.reloadFilters)
    }

    enum Output {
        case reloadTeacherList
        case reloadFilters
    }
}
