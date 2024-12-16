//
//  ContentView.swift
//  ToolBarInSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

/// toolbar(content:)
/// A view modifier that populates the toolbar or navigation bar with the
/// specified items.
/// https://developer.apple.com/documentation/swiftui/view/toolbar(content:)-5w0tj

struct ContentView: View {
    
    @State private var text = "Hello"
    @State private var bold = false
    @State private var italic = false
    @State private var fontSize = 12.0
    
    var displayFont: Font {
        let font = Font.system(size: CGFloat(fontSize),
                               weight: bold == true ? .bold : .regular)
        return italic == true ? font.italic() : font
    }
    
    
    var body: some View {
        
        TextEditor(text: $text)
            .font(displayFont)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Slider(
                        value: $fontSize,
                        in: 8...120,
                        minimumValueLabel:
                            Text("A").font(.system(size: 8)),
                        maximumValueLabel:
                            Text("A").font(.system(size: 16))
                    ) {
                        Text("Font Size (\(Int(fontSize)))")
                    }
                    .frame(width: 150)
                    Toggle(isOn: $bold) {
                        Image(systemName: "bold")
                    }
                    Toggle(isOn: $italic) {
                        Image(systemName: "italic")
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
