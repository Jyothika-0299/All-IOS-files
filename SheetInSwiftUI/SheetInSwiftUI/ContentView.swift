//
//  ContentView.swift
//  SheetInSwiftUI
//
//  Created by FCI on 06/12/24.
//

import SwiftUI

/// sheet(isPresented:onDismiss:content:) Modifier
/// Presents a sheet when a binding to a Boolean value that you provide is true.
///
/// https://developer.apple.com/documentation/SwiftUI/View/sheet(isPresented:onDismiss:content:)

struct ContentView: View {
    
    @State private var sheetShown = false
    
    
    
    var body: some View {
       
        /// Show sheet upon button tap
        Button("Show Agreement") {
            sheetShown = true
        }
        .sheet(isPresented: $sheetShown) {
            VStack {
                
                Text("Agreement")
                /// Dismiss sheet upon button tap
                Button("Dismiss") {
                    sheetShown = false
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
