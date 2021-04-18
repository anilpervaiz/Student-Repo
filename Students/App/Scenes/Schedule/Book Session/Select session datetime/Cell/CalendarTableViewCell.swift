//
//  CalendarTableViewCell.swift
//  Students
//
//  Created by Rahim on 17/04/2021.
//

import UIKit
import FSCalendar

class CalendarTableViewCell: UITableViewCell,
                             ReusableView {

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter
    }()

    @IBOutlet weak var calendarView: FSCalendar! {
        didSet {
            calendarView.delegate = self
            calendarView.dataSource = self
            calendarView.setupStyle()
        }
    }
    @IBOutlet weak var monthLabel: UILabel! {
        didSet {
            monthLabel.text = dateFormatter.string(from: Date())
        }
    }

    @IBAction func didTapLeftButton(_ sender: Any) {
        calendarView.setCurrentPage(calendarView.previousPage, animated: true)
    }
    @IBAction func didTapRightButton(_ sender: Any) {
        calendarView.setCurrentPage(calendarView.nextPage, animated: true)
    }

    func configure(with viewModel: CalendarTableCellViewModel) {}
}

extension CalendarTableViewCell: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .next || monthPosition == .previous {
            calendar.setCurrentPage(date, animated: true)
        }
    }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        monthLabel.text = dateFormatter.string(from: calendar.currentPage)
    }
}

struct CalendarTableCellViewModel: TableCellViewModel {

}
