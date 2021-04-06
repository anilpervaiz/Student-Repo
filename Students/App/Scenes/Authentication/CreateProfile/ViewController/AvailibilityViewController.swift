//
//  AvailibilityViewController.swift
//  Teachers
//
//  Created by Rahim on 21/03/2021.
//

import UIKit

class AvailibilityViewController: UIViewController {

    var viewModel: AvailibilityViewModel?

    @IBOutlet weak var hoursCollectionView: UICollectionView! {
        didSet {
            hoursCollectionView.delegate = self
            hoursCollectionView.dataSource = self
            hoursCollectionView.registerNibCell(with: AvailibilityHourCell.self)
            (hoursCollectionView.collectionViewLayout as? TagFlowLayout)?.estimatedItemSize = CGSize(width: 140, height: 40)
        }
    }
    @IBOutlet weak var dayCollectionView: UICollectionView! {
        didSet {
            dayCollectionView.delegate = self
            dayCollectionView.dataSource = self
            dayCollectionView.registerNibCell(with: AvailibilityDayCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Availability"
    }
    @IBAction func didTapCTAButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AvailibilityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == hoursCollectionView {
            return viewModel?.numberOfHours() ?? 0
        } else {
            return viewModel?.numberOfDays() ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == hoursCollectionView {
            let cell = collectionView.dequeueReusableCell(withType: AvailibilityHourCell.self,
                                                          for: indexPath)
            if let cellViewModel = viewModel?.hour(at: indexPath.row) {
                cell.configure(with: cellViewModel)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withType: AvailibilityDayCell.self,
                                                          for: indexPath)
            if let cellViewModel = viewModel?.day(at: indexPath.row) {
                cell.configure(with: cellViewModel)
            }
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == hoursCollectionView {
            viewModel?.didSelectHour(at: indexPath.row)
        } else {
            viewModel?.didSelectDay(at: indexPath.row)
        }
        collectionView.reloadData()
    }
}

extension AvailibilityViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
