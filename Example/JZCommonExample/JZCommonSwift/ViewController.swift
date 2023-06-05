//
//  ViewController.swift
//  JZCommonSwift
//
//  Created by S JZ on 2023/6/5.
//

import UIKit

class ViewController: JZViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarAppearance.backgroundColor = .green
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}

