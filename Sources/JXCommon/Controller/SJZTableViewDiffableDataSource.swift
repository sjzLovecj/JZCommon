//
//  SJZTableViewDiffableDataSource.swift
//  SJZ
//
//  Created by S JZ on 2022/10/31.
//

import UIKit

/// 编辑所需类型
public typealias editRowType = (_ tableView: UITableView, _ editingStyle: UITableViewCell.EditingStyle, _ indexPath: IndexPath) -> ()
/// 移动所需类型
public typealias moveRowtype = (_ tableView: UITableView, _ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> ()

open class SJZTableViewDiffableDataSource<SectionType, ItemType>: UITableViewDiffableDataSource<SectionType, ItemType> where SectionType: Hashable, ItemType: Hashable {
   
    public var editRow: editRowType?
    public var moveRow: moveRowtype?
    
    open override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return tableView.isEditing
    }
    
    open override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        editRow?(tableView, editingStyle, indexPath)
    }
    
    open override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return tableView.isEditing
    }
    
    open override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRow?(tableView, sourceIndexPath, destinationIndexPath)
    }
}
