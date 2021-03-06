//
//  CustomNibView.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class CustomNibView: UIView {

    private(set) var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupXIB()
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.setupXIB()
        self.setupView()
    }

    func setupView() {
        //Should be overridden by other classes of custom nib.
    }

    private func setupXIB() {

        self.contentView = loadView()

        self.contentView.frame = self.bounds
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.contentView)
    }

    func loadView() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String.init(describing: type(of: self)), bundle: bundle)

        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView

        return view
    }

}
