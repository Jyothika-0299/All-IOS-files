//
//  ContentView.swift
//  GroupBoxInSwiftUI
//
//  Created by FCI on 06/12/24.
//

//  ContentView.swift
//  GroupBoxInSwiftUI
//
//  Created by Naga Murali Akula on 03/07/24.
//

import SwiftUI

/// Use a group box when you want to visually distinguish a portion of your user interface with an optional title for the boxed content.
///
/// In iOS 15: GroupBox in SwiftUI groups views with a light background. You can add a header for titles. By default, views in GroupBox align vertically, like stacking three text views.
///
/// /// https://developer.apple.com/documentation/swiftui/groupbox
/// A stylized view, with an optional label, that visually collects a logical grouping of content.


struct ContentView: View {
    
    @State private var userAgreed = false
    
    var body: some View {
        
        GroupBox(label:
            Label("Terms of Use", systemImage: "building.columns")
            .padding(.vertical)
        ) {
            ScrollView(.vertical, showsIndicators: true) {
                Text(agreementText)
                    .font(.footnote)
            }
            .frame(height: 250)
            Toggle(isOn: $userAgreed) {
                Text("I agree to the above terms")
            }
        }
        .padding()
        
    }
}

var agreementText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"""
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
