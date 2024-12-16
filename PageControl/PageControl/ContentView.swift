//
//  ContentView.swift
//  PageControl
//
//  Created by FCI on 05/12/24.
//

/// https://developer.apple.com/documentation/SwiftUI/PageTabViewStyle

import SwiftUI

struct ContentView: View {
    var body: some View {
        /// Wrap views in a TabView
        TabView {
            FirstTabView()
            SecondTabView()
            ThirdTabView()
        }
        /// Specify the tab view style to page
        .tabViewStyle(.page)
        /// Specify the index style to page and always show in display
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct FirstTabView: View {
    var body: some View {
        Text("First tab")
    }
}

struct SecondTabView: View {
    var body: some View {
        Text("Second tab")
    }
}

struct ThirdTabView: View {
    var body: some View {
        Text("Third tab")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
