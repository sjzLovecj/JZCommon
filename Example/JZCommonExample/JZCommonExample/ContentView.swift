//
//  ContentView.swift
//  JZCommonExample
//
//  Created by S JZ on 2023/6/1.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
//        .preferred
//        .statusBarHidden()
//        .preferredColorScheme(.dark)
//        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
