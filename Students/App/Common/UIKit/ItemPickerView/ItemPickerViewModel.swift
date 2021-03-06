//
//  ItemPickerViewModel.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

typealias ItemPickerViewModelOutput = (ItemPickerViewModel.Output) -> Void

protocol ItemPickerViewModelProtocol {
    var output: ItemPickerViewModelOutput? { get set}
    var numberOfRows: Int { get }
    func getItemTitle(at index: Int) -> String
    func getPickerModel(at index: Int) -> PickerItemModel
    mutating func setData(data: [PickerItemModel])
}

struct ItemPickerViewModel: ItemPickerViewModelProtocol {
    var output: ItemPickerViewModelOutput?

    mutating func setData(data: [PickerItemModel]) {
        self.data = data
        output?(.reloadData)
    }

    var data: [PickerItemModel]

    var numberOfRows: Int {
        return data.count
    }

    func getItemTitle(at index: Int) -> String {
        return data[index].title
    }

    func getPickerModel(at index: Int) -> PickerItemModel {
        return data[index]
    }

    enum Output {
        case reloadData
    }
}

protocol PickerItemModel {
    var title: String { get set }
    var key: String { get set }
}
