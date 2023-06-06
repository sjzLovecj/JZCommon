//
//  ScendViewController.swift
//  JZCommonSwift
//
//  Created by S JZ on 2023/6/6.
//

import UIKit

class ScendViewController: JZViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavBarAppearance { appearce in
            appearce.backgroundColor = .green
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let ctr = ThirdViewController()
        navigationController?.pushViewController(ctr, animated: true)
    }
}
