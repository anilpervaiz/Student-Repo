//
//  BrowseSubjectBasedTeacherViewController.swift
//  Students
//
//  Created by Rahim on 29/04/2021.
//

import UIKit

class BrowseSubjectBasedTeacherViewController: BrowseTeacherViewController {

    override func setupNavigationBar() {
        self.title = viewModel?.subject?.subject
        let filterButton = UIBarButtonItem(
            image: Asset.Media.filter.image,
            style: .plain,
            target: self,
            action: #selector(didTapFilterButton)
        )
        filterButton.tintColor = Asset.Colors.gray.color
        navigationItem.rightBarButtonItem = filterButton
    }

    @objc func didTapFilterButton() {
        viewModel?.didTapFilterButton()
    }
}
