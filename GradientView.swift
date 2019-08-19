//
//  GradientView.swift
//  WindChillCRM
//
//  Created by Winter Family on 3/14/19.
//  Copyright © 2019 thecooldev. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class GradientView: UIView {
    
    @IBInspectable public var startColor: UIColor = #colorLiteral(red: 0.1058823529, green: 0.09803921569, blue: 0.5647058824, alpha: 1) { didSet { updateColors() } }
    @IBInspectable public var endColor:   UIColor = #colorLiteral(red: 0.3450980392, green: 0.5176470588, blue: 0.8274509804, alpha: 1) { didSet { updateColors() } }
    
    override open class var layerClass: AnyClass { return CAGradientLayer.self }
    
    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
        config()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    private func config() {
        updateColors()
    }
    
    private func updateColors() {
        let gradientLayer = layer as! CAGradientLayer
        
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
}

@IBDesignable
public class AnimatingGradientView: UIView {
    
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0

    @IBInspectable public var startColor: CGColor = #colorLiteral(red: 0.1058823529, green: 0.09803921569, blue: 0.5647058824, alpha: 1).cgColor { didSet { updateColors() } }
    @IBInspectable public var endColor:   CGColor = #colorLiteral(red: 0.4156862745, green: 0.6392156863, blue: 0.9019607843, alpha: 1).cgColor { didSet { updateColors() } }
    
    override open class var layerClass: AnyClass { return CAGradientLayer.self }
    
    override public init(frame: CGRect = .zero) {
        super.init(frame: frame)
        config()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        config()
    }
    
    private func config() {
        updateColors()
    }
    
    private func updateColors() {
        let gradientLayer = layer as! CAGradientLayer
        
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        animateGradient()
    }
    
    public func animateGradient() {
        let gradientLayer = layer as! CAGradientLayer
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.fromValue = [startColor, endColor]
        gradientChangeAnimation.toValue = [endColor, startColor]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.autoreverses = true
        gradientChangeAnimation.repeatCount = .infinity
		gradientChangeAnimation.isRemovedOnCompletion = false
        gradientLayer.add(gradientChangeAnimation, forKey: "colorChange")
    }
}
