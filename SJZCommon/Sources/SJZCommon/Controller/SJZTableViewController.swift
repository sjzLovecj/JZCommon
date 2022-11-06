//
//  SJZTableViewController.swift
//  SJZ
//
//  Created by S JZ on 2022/10/31.
//

import UIKit

open class SJZTableViewController<SectionType, ItemType>: SJZBaseController where SectionType: Hashable, ItemType: Hashable {
    
    open lazy var snapshot: NSDiffableDataSourceSnapshot<SectionType, ItemType> = NSDiffableDataSourceSnapshot<SectionType, ItemType>()
    open lazy var dataSource: SJZTableViewDiffableDataSource<SectionType, ItemType> = {
        let dataSource = SJZTableViewDiffableDataSource<SectionType, ItemType>.init(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, itemIdentifier in
            guard let self = self else { return UITableViewCell(style: .default, reuseIdentifier: "defaultCell") }
            return self.configureCellProvider(tableView, indexPath, itemIdentifier)
        })

        return dataSource
    }()
    
    // tableView的样式，如果需要更改，请override 重新赋值
    open var tableViewStyle: UITableView.Style {
        .plain
    }
    
    public var isTableViewEditing: Bool = false {
        didSet {
            if isTableViewEditing {
                tableView.isEditing = true
//                tableView.dataSource = dataSource
            }else {
                tableView.isEditing = false
//                tableView.dataSource
            }
            
            // 默认情况下，编辑模式是不允许Cell的点击事件，使用这个属性，可以允许点击
            tableView.allowsSelectionDuringEditing = true
        }
    }
    
    public private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: tableViewStyle)
        tableView.backgroundColor = UIColor.clear
//        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func buildSubView(contentView superView: UIView) {
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "defaultCell")
        addSubView(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    /// 创建Cell
    /// - Parameters:
    ///   - tableView: tableView
    ///   - indexPath: cell位置
    ///   - itemIdentifier: cell数据模型
    /// - Returns: 创建的Cell
    open func configureCellProvider(_ tableView: UITableView, _ indexPath: IndexPath, _ itemIdentifier: ItemType) -> UITableViewCell? {
        return UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
    }
}
