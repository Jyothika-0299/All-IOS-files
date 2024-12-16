//
//  ContentView.swift
//  DisclosureGroupInSwiftUI
//
//  Created by FCI on 06/12/24.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/disclosuregroup
/// Disclosure Group:
/// A view that shows or hides another content view,
/// based on the state of a disclosure control.
///

struct ContentView: View {
    
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true
    
    var body: some View {
        
        /// Will show the disclosure group as expanded
        DisclosureGroup("Items", isExpanded: $topExpanded) {
            Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
            Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
            
            /// but by default a disclosure group is collapsed
            DisclosureGroup("Sub-items") {
                /// You can also nest a disclosure group inside a disclosure
                /// group
                Text("Sub-item 1")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
