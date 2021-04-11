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

    var numberOfFilters: Int {
        filters.count
    }

    var numberOfTeachers: Int {
        teachers.count
    }

    func filter(at index: Int) -> String {
        filters[index]
    }

    func teacher(at index: Int) -> WishList {
        teachers[index]
    }

    func didSelectTeacher(at index: Int) {
        
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
