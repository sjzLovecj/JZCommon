//
//  ViewController.swift
//  Demo
//
//  Created by S JZ on 2022/11/1.
//

import UIKit

class ViewController: SJZTableViewController<String, String> {
    
    override var tableViewStyle: UITableView.Style {
        return .insetGrouped
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isStatusBarDark = false
    }
}

