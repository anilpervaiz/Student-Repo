//
//  OnboardingViewController.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import UIKit

class OnboardingViewController: BaseViewController {

    var pages = OnboardingPage.allCases

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.bounces = false
            collectionView.isPagingEnabled = true
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.registerNibCell(with: OnboardingCollectionViewCell.self)
        }
    }
    @IBOutlet weak var pageControl: PageControlView! {
        didSet {
            pageControl.numberOfPages = pages.count
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
}

extension OnboardingViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withType: OnboardingCollectionViewCell.self, for: indexPath)
        cell.configure(for: pages[indexPath.row])

        return cell
    }
}

// MARK: - CollectionView Delegate
extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.frame.width
        let currentPage = collectionView.contentOffset.x / pageWidth
        let currentPageAbs = Int(currentPage)
        // Only show animation if its a new page.
        if currentPage == CGFloat(currentPageAbs) &&
            currentPageAbs != pageControl.currentPage {
            pageControl.currentPage = currentPageAbs
            skipButton.isHidden = currentPageAbs == (pages.count - 1)
        }
    }
}

// MARK: - CollectionView Delegate Flow Layout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
}
