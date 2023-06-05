//
//  CircularView.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/5.
//

import UIKit

public class CircularView: UIView {
    
//    var circulayType: UIRectCorner = .allCorners
//    var cornerRadius: CGFloat = 0
//    var fillColor: UIColor = .white
//
//    override class var layerClass: AnyClass {
//        return CAShapeLayer.classForCoder()
//    }
//
//    fileprivate var shapeLayer: CAShapeLayer? {
//        return layer as? CAShapeLayer
//    }
//
//    init(cornerRadius: CGFloat, circularType: UIRectCorner, fillColor: UIColor = .white, shadowColor: UIColor? = nil, shadowOffSet: CGSize? = nil, opacity: Float? = nil, radius: Float? = nil) {
//        super.init(frame: .zero)
//
//        self.cornerRadius = cornerRadius
//        self.circulayType = circularType
//        self.fillColor = fillColor
//        shapeLayer?.fillColor = fillColor.cgColor
//
//        // 设置阴影
//        if let shadowColor = shadowColor {
//            shapeLayer?.shadowColor = shadowColor.cgColor
//            shapeLayer?.shadowOffset = shadowOffSet ?? .zero
//            shapeLayer?.shadowOpacity = opacity ?? 0
//            shapeLayer?.shadowRadius = CGFloat(radius ?? 0)
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        setCircular(corner: circulayType, radii: CGSize(width: cornerRadius, height: cornerRadius))
//    }
//
//    func setCircular(corner: UIRectCorner, radii: CGSize) {
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: radii)
//
//        shapeLayer?.bounds = bounds
//        shapeLayer?.path = path.cgPath
//
//        shapeLayer?.fillColor = fillColor.cgColor
//        shapeLayer?.strokeColor = fillColor.cgColor
//    }
    
}
