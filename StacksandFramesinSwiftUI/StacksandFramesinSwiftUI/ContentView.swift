//
//  ContentView.swift
//  StacksandFramesinSwiftUI
//
//  Created by FCI on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            Image(systemName: "goforward.10")
                .padding()
            Image(systemName: "goforward.15")
                .padding()
            Image(systemName: "goforward.30")
                .padding()
        }
        .padding()
        HStack {
            Image(systemName: "goforward.10")
                .padding()
            Image(systemName: "goforward.15")
                .padding()
            Image(systemName: "goforward.30")
                .padding()
        }
        .padding()
      
        
        
        
    }
}

#Preview {
    ContentView()
}
