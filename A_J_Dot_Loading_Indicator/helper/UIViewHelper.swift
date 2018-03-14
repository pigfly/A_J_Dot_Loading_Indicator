//
//  UIViewHelper.swift
//  A_J_Dot_Loading_Indicator
//
//  Created by Alex Jiang on 14/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.
//

import UIKit

// MARK: - Safe Add SubView

public extension UIView {
    public func safeAddSubView(subView: UIView, viewTag: Int = 1000000) {
        guard tag != viewTag else { return }

        let addedView = subviews.flatMap { $0.viewWithTag(viewTag) }.first

        if let _addedView = addedView {
            _addedView.removeFromSuperview()
        }

        subView.tag = viewTag
        addSubview(subView)
    }
}

// MARK: - Nib Loadable

public protocol NibLoadable: class {
    static var nibName: String { get }
    static var bundle: Bundle? { get }
}

public extension NibLoadable {
    static var bundle: Bundle? {
        return Bundle(for: Self.self)
    }

    static var nibName: String {
        return String(describing: Self.self)
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: bundle)
    }
}

public extension NibLoadable where Self: UIView {
    static func createFromNib(_ owner: AnyObject? = nil) -> Self {
        return (nib.instantiate(withOwner: owner, options: nil).first as? Self)!
    }
}
