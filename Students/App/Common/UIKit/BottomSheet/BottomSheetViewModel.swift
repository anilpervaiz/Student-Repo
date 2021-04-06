//
//  BottomSheetViewModel.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class BottomSheetViewModel {
    var title: String
    var items: [BottomSheetListCellViewModel]

    var numberOfItems: Int {
        items.count
    }

    var selectedItem: String? {
        return items.first {
            $0.isSelected
        }?.title
    }

    init(with title: String,
         items: [BottomSheetListCellViewModel]) {
        self.title = title
        self.items = items
    }

    func item(at index: Int) -> BottomSheetListCellViewModel {
        items[index]
    }

    func didSelectItem(at index: Int) {
        for index in 0..<numberOfItems {
            items[index].isSelected = false
        }
        items[index].isSelected = true
    }
}
