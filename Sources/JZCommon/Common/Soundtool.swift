//
//  Soundtool.swift
//  
//
//  Created by S JZ on 2023/6/12.
//

import UIKit
import SwiftUI

public struct Soundtool {
    public static let shared: Soundtool = Soundtool()
    
    @AppStorage("isSoundTool") public var isSoundTool: Bool = true
    
    public static func systemGenerator() {
        if Soundtool.shared.isSoundTool {
            let impactLight = UIImpactFeedbackGenerator(style: .heavy)
            impactLight.impactOccurred()
        }
    }
}
