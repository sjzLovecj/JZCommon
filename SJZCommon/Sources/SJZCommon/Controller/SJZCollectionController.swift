//
//  SJZCollectionController.swift
//  SJZ
//
//  Created by S JZ on 2022/10/31.
//

import UIKit

class SJZCollectionController<SectionType, ItemType>: SJZBaseController where SectionType: Hashable, ItemType: Hashable {

    // 数据源
    public var dataSource: UICollectionViewDiffableDataSource<SectionType, ItemType>!
    // 快照
    public lazy var snapshot: NSDiffableDataSourceSnapshot<SectionType, ItemType> = NSDiffableDataSourceSnapshot<SectionType, ItemType>()
    
    // collectionView
    public private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isEditing = true
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    public func configureLayout() -> UICollectionViewLayout {
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { section, environment in
            return nil
        }, configuration: configure)
        return layout
    }
    
    // 封装注册Cell
    public func registCell<Cell>(CellType: Cell.Type, handler: @escaping UICollectionView.CellRegistration<Cell, ItemType>.Handler) -> UICollectionView.CellRegistration<Cell, ItemType> where Cell: UICollectionViewCell {
        let cell = UICollectionView.CellRegistration<Cell, ItemType>{ (cell, indexPath, identifier) in
            handler(cell, indexPath, identifier)
        }
        
        return cell
    }
    
    // 封装DateSource
    public func configureDataSource(configuredResuableCell: @escaping UICollectionViewDiffableDataSource<SectionType, ItemType>.CellProvider) {
        dataSource = UICollectionViewDiffableDataSource<SectionType, ItemType>.init(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            return configuredResuableCell(collectionView, indexPath, itemIdentifier)
        })
    }

}
