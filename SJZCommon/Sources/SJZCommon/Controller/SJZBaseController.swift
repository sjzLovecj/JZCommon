//
//  SJZBaseController.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import UIKit


public typealias AssociatedKeyHolder<T> = [Int : T]

// 用于统一设置
public class SJZBaseModel {
    // 用于设置统一背景色
    public var backgroundColor: UIColor = UIColor.white
    // 用于设置统一导航View
    public var navigationConfig: SJZNavBarConfig = SJZNavBarConfig()
    // 设置返回按钮颜色
    public var backImageName: String = ""
}

public class SJZBaseController: UIViewController {
    // 用于统一设置Model
    static var baseModelKey = AssociatedKeyHolder<SJZBaseModel>()
    static var baseModel: SJZBaseModel? {
        get { SJZBaseController.baseModelKey[1] }
        set { SJZBaseController.baseModelKey[1] = newValue }
    }
    
    // MARK: - 自定义导航栏
    // 隐藏自定义导航
    public var navigationBarViewHidden: Bool = false {
        didSet {
            navigationBarView.isHidden = navigationBarViewHidden
            
            if navigationBarViewHidden {
                navigationBarView.configuration.navBarHeight = 0
            }else {
                navigationBarView.configuration.navBarHeight = navigationHeight
            }
        }
    }

    // 自定义导航栏
    public lazy var navigationBarView: SJZNavBarView = SJZNavBarView(frame: .zero)
    
    // 返回按钮
    private lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return backButton
    }()
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - 设置状态栏
    public var isStatusBarDark: Bool = true {
        didSet {
            // 刷新状态栏
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // 改变状态栏样式
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        if isStatusBarDark {
            return .darkContent
        }
        
        return .lightContent
    }
    
    // 是否隐藏系统导航
    private var isHiddenNav: Bool = true
    
    // 容器View
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if let baseModel = SJZBaseController.baseModel {
            view.backgroundColor = baseModel.backgroundColor
            
            navigationBarView.configuration = baseModel.navigationConfig
            
            if !baseModel.backImageName.isEmpty {
                if let image = UIImage(named: baseModel.backImageName) {
                    backButton.setImage(image, for: .normal)
                    navigationBarView.leftItem = backButton
                }else if let image = UIImage(systemName: baseModel.backImageName) {
                    backButton.setImage(image, for: .normal)
                    navigationBarView.leftItem = backButton
                }
            }
        }
        
        if navigationController != nil {
            // 默认显示
            navigationBarViewHidden = false
            view.addSubview(navigationBarView)
            navigationBarView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(navigationBarView.configuration.navBarHeight)
            }
            
            view.addSubview(contentView)
            contentView.snp.makeConstraints { make in
                make.bottom.left.right.equalToSuperview()
                make.top.equalTo(navigationBarView.snp.bottom)
            }
        }else {
            view.addSubview(contentView)
            contentView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }

        buildSubView(contentView: contentView)
    }
    
    /// 给容器视图添加子视图
    /// - Parameter view: 添加的子视图
    public func addSubView(_ view: UIView) {
        contentView.addSubview(view)
    }
    
    /// 构建子视图
    /// - Parameter superView: 父视图，容器视图contentView
    public func buildSubView(contentView superView: UIView) {
        
    }
    
    // MARK: - 显示隐藏系统Nav
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isHiddenNav {
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
        
        if let contain = navigationController?.viewControllers.contains(self), !contain {
            navigationBarViewHidden = true
        }
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isHiddenNav {
            if pushOrPopIsHidden() == false {
                navigationController?.setNavigationBarHidden(false, animated: animated)
            }
        }
    }
    
    private func pushOrPopIsHidden() -> Bool {
        if let viewControllers = navigationController?.viewControllers, !viewControllers.isEmpty {
            if let vc = viewControllers[viewControllers.count - 1] as? SJZBaseController {
                return vc.isHiddenNav
            }
            return false
        }
        
        return false
    }
    
    // 释放
    deinit {
        NotificationCenter.default.removeObserver(self)
        debugPrint("\(Self.Type.self) ------ 已经释放")
    }
}
