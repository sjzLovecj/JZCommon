//
//  GradientView.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/2.
//

import UIKit

// 渐变色View
public class GradientView: UIView {
    // 返回layerClass
    public override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    fileprivate var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }
    
    @objc public var colors: [Any]? {
        get { return gradientLayer?.colors }
        set { gradientLayer?.colors = newValue }
    }
    
    @objc public var locations: [NSNumber]? {
        get { return gradientLayer?.locations }
        set { gradientLayer?.locations = newValue }
    }
    
    @objc public var startPoint: CGPoint {
        get { return gradientLayer?.startPoint ?? .zero }
        set { gradientLayer?.startPoint = newValue }
    }
    
    @objc public var endPoint: CGPoint {
        get { return gradientLayer?.endPoint ?? .zero }
        set { gradientLayer?.endPoint = newValue }
    }
    
    @objc public var type: CAGradientLayerType {
        get { return gradientLayer?.type ?? .axial }
        set { gradientLayer?.type = newValue }
    }

}
