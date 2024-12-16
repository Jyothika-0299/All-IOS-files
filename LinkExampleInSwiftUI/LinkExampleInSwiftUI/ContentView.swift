//
//  ContentView.swift
//  LinkExampleInSwiftUI
//
//  Created by FCI on 06/12/24.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/link
/// A user interface control which allows the user to trigger an open
/// URL action. This control can be used to navigate outside of the app.
///
/// To create a Link, you provide a title (or label) and a URL as the destination.
/// Here's an example of creating a link to navigate to "apple.com":

struct ContentView: View {
    var body: some View {
        /*
        /// A link that, when tapped, navigates the user to "apple.com"
        Link("Go to Apple Domain site",
             destination: URL(string: "https://apple.com/")!)
         */
        
        /// A custom-styled link that, when tapped, navigates the user to "codewithchris.com"
        Link(destination: URL(string: "https://codewithchris.com/")!) {
            /// The button is visually represented by an HStack containing an image (depicting a globe)
            /// and a text saying "Visit us!". Both elements have a large title font, and the whole
            HStack(spacing: 20.0) {
                Image(systemName: "globe")
                    .font(.largeTitle)
                Text("Visit us!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            /// button is styled with a blue background, white foreground, rounded corners, and some padding.
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10.0)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
