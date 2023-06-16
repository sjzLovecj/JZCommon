//
//  BundleEx.swift
//  
//
//  Created by S JZ on 2023/6/9.
//

import UIKit

extension Bundle {

    #if !JZCOMMON
    private class _BundleClass { }
    #endif

    static var current: Bundle {
        #if JZCOMMON
        return Bundle.module
        #else
        return Bundle(for: _BundleClass.self)
        #endif
    }
}

public struct JZCommonBundle {
    static var bundle: Bundle {
        let path = Bundle.current.path(forResource: "JZCommon", ofType: "bundle", inDirectory: nil)
        let bundle = Bundle(path: path ?? "")
        return bundle ?? Bundle.current
    }
}
