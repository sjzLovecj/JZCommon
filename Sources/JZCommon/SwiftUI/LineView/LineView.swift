//
//  LineView.swift
//  
//
//  Created by S JZ on 2023/5/9.
//

import SwiftUI

struct LineView: ViewModifier {
    
    var isShowLine: Bool = true
    var lineHeight: CGFloat = 0.5
    var lineColor: Color = Color("lineColor", bundle: JZCommonBundle.bundle)
    var paddingEdges: Edge.Set? = nil
    var paddingLength: CGFloat? = nil
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            
            if isShowLine {
                if let paddingEdges {
                    if let paddingLength {
                        Divider()
                            .frame(height: lineHeight)
                            .background(lineColor)
                            .padding(paddingEdges, paddingLength)
                            
                    }else {
                        Divider()
                            .frame(height: lineHeight)
                            .background(lineColor)
                            .padding(paddingEdges)
                    }
                }else {
                    Divider()
                        .frame(height: lineHeight)
                        .background(lineColor)
                }
            }
        }
    }
}

public extension View {
    func lineView(isShowLine: Bool = true,
                  lineHeight: CGFloat = 0.5,
                  lineColor: Color? = nil,
                  paddingEdges: Edge.Set? = nil,
                  paddingLength: CGFloat? = nil) -> some View {
        if let lineColor {
            return self.modifier(LineView(isShowLine: isShowLine, lineHeight: lineHeight, lineColor: lineColor, paddingEdges: paddingEdges, paddingLength: paddingLength))
        }else {
            return self.modifier(LineView(isShowLine: isShowLine, lineHeight: lineHeight, paddingEdges: paddingEdges, paddingLength: paddingLength))
        }
        
    }
}
