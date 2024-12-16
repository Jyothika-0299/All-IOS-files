//
//  ContentView.swift
//  SegmentedControl
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .red
    var body: some View {
        VStack {
                Text("Select Background Color")
                /// Add a Picker, and set its picker style to .segmented
                Picker("Background Color",selection: $selectedColor) {
                /// The tag will change the value of $selectedColor
                /// upon selection
                Text("Red").tag(Color.red)
                Text("Green").tag(Color.green)
                Text("Blue").tag(Color.blue)
                }
                /// Set it's style with the picker style modifier
                    
                .pickerStyle(.segmented)
                //.pickerStyle(.menu)
                Spacer()
        }
                .frame(maxWidth: .infinity)
                .background(selectedColor)
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
