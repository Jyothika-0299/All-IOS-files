//
//  ContentView.swift
//  SrollViewInSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/scrollview
/// A view that provides a scrolling interface to navigate through a set of content.
///
/// In SwiftUI, the ScrollView allows content that exceeds the bounds of the screen
/// or its container to be accessible by scrolling. It can operate both vertically and
/// horizontally. The content inside a ScrollView is laid out once and does not change,
/// even if the content is scrolled out of view.
///
/// In this example, we present a vertical ScrollView containing a list of colored rectangles.
/// This demonstrates how content can extend beyond the visible frame, requiring the user to
/// scroll to see the entirety of the content.
///

struct ContentView: View {
    /// Colors for demonstration purposes
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow, .gray]

    /// The main view content which is rendered and displayed on the screen
    ///
    var body: some View {
        
        /// A vertical ScrollView.
        ScrollView(.vertical, showsIndicators: true) {
            /// A VStack containing colored rectangles.
            VStack(spacing: 20) {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                        .frame(height: 200)
                        .cornerRadius(15)
                }
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: true) {
                /// A HStack containing colored rectangles.
                HStack(spacing: 20) {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .fill(color)
                            .frame(width: 200, height: 200)
                            .cornerRadius(15)
                    }
                }
                .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
