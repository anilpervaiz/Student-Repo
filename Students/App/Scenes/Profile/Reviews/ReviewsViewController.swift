//
//  ReviewsViewController.swift
//  Teachers
//
//  Created by Rahim on 31/03/2021.
//

import UIKit

class ReviewsViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: ReviewTableViewCell.self)
        }
    }
    var reviews: [Review] = Review.mockData

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Reviews"
    }
}

extension ReviewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: ReviewTableViewCell.self)
        cell.configure(with: reviews[indexPath.row])
        return cell
    }
}

extension ReviewsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
