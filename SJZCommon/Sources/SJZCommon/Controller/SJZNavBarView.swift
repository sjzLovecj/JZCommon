//
//  SJZNavBarView.swift
//  SJZBill
//
//  Created by SJZ on 2022/8/25.
//

import UIKit
import SnapKit

open class SJZNavBarConfig {
    // 设置背景颜色
    public var backgroundColor: UIColor = UIColor.white {
        didSet {
            navBarView?.backgroundColor = backgroundColor
        }
    }
    
    // 设置文字颜色
    public var titleColor: UIColor? = UIColor.white {
        didSet {
            navBarView?.titleLabel.textColor = titleColor
        }
    }

    // 设置文字字体
    public var titleFont: UIFont = UIFont.medium(18) {
        didSet {
            navBarView?.titleLabel.font = titleFont
        }
    }
    
    // 设置文字方向
    public var textAlignment: NSTextAlignment = .center {
        didSet {
            navBarView?.titleLabel.textAlignment = textAlignment
        }
    }
    
    // 左侧距离边距间隔
    public var leftItemSpacing: CGFloat = 10 {
        didSet {
            navBarView?.leftSpacing = leftItemSpacing
        }
    }
    
    // 右侧距离边距间隔
    public var rightItemSpacing: CGFloat = 10 {
        didSet {
            navBarView?.rightSpacing = rightItemSpacing
        }
    }
    
    // 设置导航高度
    public var navBarHeight: CGFloat = navigationHeight {
        didSet {
            var height = navigationHeight
            if navBarHeight > navigationHeight {
                height = navBarHeight
            }else if navBarHeight == 0 {
                height = 0
            }
            
            if let _ = navBarView?.superview {
                navBarView?.snp.updateConstraints { make in
                    make.height.equalTo(height)
                }
            }
        }
    }
    
    fileprivate weak var navBarView: SJZNavBarView?
}

open class SJZNavBarView: UIView {

    // 设置navigation View
    public var customView: UIView? {
        didSet {
            if let customView = customView {
                titleLabel.isHidden = true
                
                customView.layoutIfNeeded()
                addSubview(customView)
                customView.snp.makeConstraints { make in
                    make.center.equalTo(titleLabel)
                    make.width.equalTo(customView.frame.size.width)
                    make.height.equalTo(customView.frame.size.height)
                }
            }else {
                titleLabel.isHidden = false
            }
        }
    }
    
    // 设置导航title
    public var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    // 导航设置
    public var configuration: SJZNavBarConfig = SJZNavBarConfig() {
        didSet {
            configuration.navBarView = self
            
            backgroundColor = configuration.backgroundColor
            titleLabel.font = configuration.titleFont
            titleLabel.textColor = configuration.titleColor
            titleLabel.textAlignment = configuration.textAlignment
            leftSpacing = configuration.leftItemSpacing
            rightSpacing = configuration.rightItemSpacing
        }
    }
    
    // 左侧按钮间隔
    public var leftSpacing: CGFloat = 0 {
        didSet {
            leftStackView.spacing = leftSpacing
        }
    }
    
    // 左侧按钮
    public var leftItem: UIView? {
        didSet {
            // 删除子视图
            leftStackView.arrangedSubviews.forEach { subView in
                subView.removeFromSuperview()
            }
            
            if let leftItem = leftItem {
                leftItem.layoutIfNeeded()
                
                leftStackView.addArrangedSubview(leftItem)
                leftItem.snp.makeConstraints { make in
                    make.width.equalTo(leftItem.frame.size.width)
                    make.height.equalTo(leftItem.frame.size.height)
                }
            }
        }
    }
    
    // 左侧视图数组
    public var leftItems: [UIView]? {
        didSet {
            // 先删除视图
            leftStackView.arrangedSubviews.forEach { subView in
                subView.removeFromSuperview()
            }
            
            if let leftItems = leftItems, !leftItems.isEmpty {
                leftItems.forEach { item in
                    item.layoutIfNeeded()
                    
                    leftStackView.addArrangedSubview(item)
                    item.snp.makeConstraints { make in
                        make.width.equalTo(item.frame.size.width)
                        make.height.equalTo(item.frame.size.height)
                    }
                }
            }
        }
    }
    
    // 右侧间隔
    public var rightSpacing: CGFloat = 0 {
        didSet {
            rightStackView.spacing = rightSpacing
        }
    }
    
    // 右侧按钮
    public var rightItem: UIView? {
        didSet {
            // 删除子视图
            rightStackView.arrangedSubviews.forEach { subView in
                subView.removeFromSuperview()
            }
            
            if let rightItem = rightItem {
                rightItem.layoutIfNeeded()
                
                rightStackView.addArrangedSubview(rightItem)
                rightItem.snp.makeConstraints { make in
                    make.width.equalTo(rightItem.frame.size.width)
                    make.height.equalTo(rightItem.frame.size.height)
                }
            }
        }
    }
    
    // 右侧按钮数组
    public var rightItems: [UIView]? {
        didSet {
            // 先删除视图
            rightStackView.arrangedSubviews.forEach { subView in
                subView.removeFromSuperview()
            }
            
            if let rightItems = rightItems, !rightItems.isEmpty {
                rightItems.forEach { item in
                    item.layoutIfNeeded()
                    
                    rightStackView.addArrangedSubview(item)
                    item.snp.makeConstraints { make in
                        make.width.equalTo(item.frame.size.width)
                        make.height.equalTo(item.frame.size.height)
                    }
                }
            }
        }
    }
    
    // ------------------------------------------
    // MARK: - 私有属性
    fileprivate lazy var leftStackView: UIStackView = {
        let leftStackView = UIStackView()
        leftStackView.spacing = 10
        leftStackView.backgroundColor = .clear
        leftStackView.axis = .horizontal    // 横向布局
        leftStackView.alignment = .center
        leftStackView.distribution = .fill
        return leftStackView
    }()
    
    fileprivate lazy var rightStackView: UIStackView = {
        let leftStackView = UIStackView()
        leftStackView.spacing = 10
        leftStackView.backgroundColor = .clear
        leftStackView.axis = .horizontal    // 横向布局
        leftStackView.alignment = .center
        leftStackView.distribution = .fill
        return leftStackView
    }()
    
    fileprivate var titleLabel: UILabel = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuration.navBarView = self
        
        backgroundColor = configuration.backgroundColor
        titleLabel.font = configuration.titleFont
        titleLabel.textColor = configuration.titleColor
        titleLabel.textAlignment = configuration.textAlignment
        leftSpacing = configuration.leftItemSpacing
        rightSpacing = configuration.rightItemSpacing
        
        buildSubView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SJZNavBarView {
    
    fileprivate func buildSubView() {
        addSubview(leftStackView)
        leftStackView.snp.makeConstraints { make in
            make.height.equalTo(navigationBarHeight)
            make.left.equalTo(12)
            make.bottom.equalToSuperview()
        }
        
        addSubview(rightStackView)
        rightStackView.snp.makeConstraints { make in
            make.height.equalTo(navigationBarHeight)
            make.right.equalTo(-12)
            make.bottom.equalToSuperview()
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(leftStackView)
        }
    }
    
    
}
