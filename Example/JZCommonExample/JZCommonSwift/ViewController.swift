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
        
        isHiddenNavigaion = true
        
//        configNavBarAppearance { appearce in
//            appearce.backgroundColor = .red
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let ctr = ScendViewController()
        navigationController?.pushViewController(ctr, animated: true)
    }
}

