//
//  UIDotLoadingIndicator.swift
//  A_J_Dot_Loading_Indicator
//
//  Created by Alex Jiang on 13/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.
//

import UIKit

//@IBDesignable
public final class UIDotLoadingIndicator : UIView {

    // MARK: - Public API

    @IBInspectable public var dotsCount: Int = 3 {
        didSet {
            layer.sublayers?.forEach { $0.removeFromSuperlayer() }
            dotLayers.removeAll()
            setupLayers()
        }
    }

    @IBInspectable public var dotsRadius: CGFloat = 6.0 {
        didSet {
            for layer in dotLayers {
                layer.bounds = CGRect(origin: .zero, size: CGSize(width: dotsRadius * 2.0, height: dotsRadius * 2.0))
                layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: dotsRadius).cgPath
            }
            setNeedsLayout()
        }
    }

    @IBInspectable public var dotsSpacing: CGFloat = 10 {
        didSet {
            setNeedsLayout()
        }
    }

    override public var tintColor: UIColor! {
        didSet {
            for layer in dotLayers {
                layer.fillColor = tintColor.cgColor
            }
        }
    }

    public func startAnimating() {
        var offset :TimeInterval = 0.0
        dotLayers.forEach {
            $0.removeAllAnimations()
            $0.add(scaleAnimation(offset), forKey: "au.com.carsales.dotLoading.scaleAnima")
            offset = offset + 0.25
        }
    }

    public func stopAnimating() {
        dotLayers.forEach { $0.removeAllAnimations() }
    }

    // MARK: - Init

    override public init(frame: CGRect) {
        super.init(frame: frame)

        setupLayers()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupLayers()
    }

    // MARK: - View Lifecycle

    public override func layoutSubviews() {
        super.layoutSubviews()

        let center = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
        let middle: Int = dotsCount / 2
        for (index, layer) in dotLayers.enumerated() {
            let x = center.x + CGFloat(index - middle) * ((dotsRadius*2)+dotsSpacing)
            layer.position = CGPoint(x: x, y: center.y)
        }
        startAnimating()
    }

    // MARK: - Private API

    private var dotLayers = [CAShapeLayer]()
    private var dotsScale = 1.3

    private func dotLayer() -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.bounds = CGRect(origin: .zero, size: CGSize(width: dotsRadius*2.0, height: dotsRadius*2.0))
        layer.path = UIBezierPath(roundedRect: layer.bounds, cornerRadius: dotsRadius).cgPath
        layer.fillColor = tintColor.cgColor
        return layer
    }

    private func setupLayers() {
        for _ in 0..<dotsCount {
            let dl = dotLayer()
            dotLayers.append(dl)
            layer.addSublayer(dl)
        }
    }

    private func scaleAnimation(_ after: TimeInterval = 0) -> CAAnimationGroup {
        let scaleUp = CABasicAnimation(keyPath: "transform.scale")
        scaleUp.beginTime = after
        scaleUp.fromValue = 1
        scaleUp.toValue = dotsScale
        scaleUp.duration = 0.3
        scaleUp.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.beginTime = after+scaleUp.duration
        scaleDown.fromValue = dotsScale
        scaleDown.toValue = 1.0
        scaleDown.duration = 0.2
        scaleDown.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

        let group = CAAnimationGroup()
        group.animations = [scaleUp, scaleDown]
        group.repeatCount = Float.infinity

        let sum = CGFloat(dotsCount)*0.2 + CGFloat(0.4)
        group.duration = CFTimeInterval(sum)

        return group
    }
}
