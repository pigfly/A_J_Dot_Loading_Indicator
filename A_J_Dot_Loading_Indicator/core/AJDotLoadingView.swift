//
//  WrapperView.swift
//  A_J_Dot_Loading_Indicator
//
//  Created by Alex Jiang on 14/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.
//

import UIKit

public final class AJDotLoadingView: UIView {

    // MARK: - Public API

    @IBOutlet weak var dotLoadingIndicator: UIDotLoadingIndicator!

    public func startAnimating() {
        dotLoadingIndicator.startAnimating()
    }

    public func stopAnimating() {
        dotLoadingIndicator.stopAnimating()
        dotLoadingIndicator.removeFromSuperview()
    }
}

private var aj_loadingIndicatorAssociationKey = 0x1023

extension AJDotLoadingView: NibLoadable {}

public extension UIView {
    private var aj_loadingIndicator: AJDotLoadingView? {
        get {
            return objc_getAssociatedObject(self, &aj_loadingIndicatorAssociationKey) as? AJDotLoadingView
        }
        set {
            objc_setAssociatedObject(self, &aj_loadingIndicatorAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public func aj_showDotLoadingIndicator() {
        let dotLoadView = AJDotLoadingView.createFromNib()
        aj_loadingIndicator = dotLoadView
        
        safeAddSubView(subView: dotLoadView, viewTag: Int(aj_loadingIndicatorAssociationKey))
        
        dotLoadView.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: dotLoadView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: dotLoadView.bottomAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: dotLoadView.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: dotLoadView.rightAnchor).isActive = true

        aj_loadingIndicator?.startAnimating()
    }

    public func aj_hideDotLoadingIndicator() {
        aj_loadingIndicator?.stopAnimating()
        aj_loadingIndicator?.removeFromSuperview()
        aj_loadingIndicator = nil
    }
}
