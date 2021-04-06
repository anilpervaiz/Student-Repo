//
//  ReusableView.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

import UIKit

protocol ReusableView {
    static var identifier: String { get }
}

// The default implementation uses the class name as the reuse identifier.
extension ReusableView {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

extension UITableView {
    func registerNibCell<T>(
        with type: T.Type
    ) where T: ReusableView, T: UITableViewCell {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.identifier)
    }

    func registerCell<T>(
        with type: T.Type
    ) where T: ReusableView, T: UITableViewCell {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func registerNibHeaderFooterView<T>(
        with type: T.Type
    ) where T: ReusableView, T: UITableViewHeaderFooterView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }

    func registerHeaderFooterView<T>(
        with type: T.Type
    ) where T: ReusableView, T: UITableViewHeaderFooterView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T>(
        withType type: T.Type
    ) -> T where T: ReusableView, T: UITableViewCell {
        dequeueReusableCell(withIdentifier: T.identifier) as! T
    }

    func dequeueReusableCell<T>(
        withType type: T.Type,
        for indexPath: IndexPath
    ) -> T where T: ReusableView, T: UITableViewCell {
        dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }

    func dequeueReusableHeaderFooterView<T>(
        withType type: T.Type
    ) -> T? where T: ReusableView, T: UITableViewHeaderFooterView {
        dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T
    }
}

extension UICollectionView {
    func registerNibCell<T>(
        with type: T.Type
    ) where T: ReusableView, T: UICollectionViewCell {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func registerCell<T>(
        with type: T.Type
    ) where T: ReusableView, T: UICollectionViewCell {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T>(
        withType type: T.Type,
        for indexPath: IndexPath
    ) -> T where T: ReusableView, T: UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }

    func dequeueSuplementaryView<T: ReusableView>(
        of kind: String,
        at indexPath: IndexPath
    ) -> T {
        let supplementaryView = dequeueReusableSupplementaryView(ofKind: kind,
                                                                 withReuseIdentifier: T.identifier,
                                                                 for: indexPath) as! T
        return supplementaryView
    }

    /// Register Programatic Header
    func registerSupplementaryView<T>(_ :T.Type, kind: String) where T: ReusableView, T: UICollectionReusableView {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }

    /// Register Programatic Header
    func registerSupplementaryViewFromNib<T>(_ :T.Type, kind: String) where T: ReusableView, T: UICollectionReusableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.identifier)
    }

}
