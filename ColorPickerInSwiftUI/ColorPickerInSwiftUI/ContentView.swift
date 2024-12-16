//
//  ContentView.swift
//  ColorPickerInSwiftUI
//
//  Created by FCI on 05/12/24.
//

// https://developer.apple.com/documentation/swiftui/colorpicker
/// A control that allows users to select a color from a palette or system interface.
///
/// In SwiftUI, the ColorPicker provides an intuitive interface for users to select a
/// color either through a color wheel, sliders, or predefined palettes, depending on the
/// platform. The chosen color updates a binding, making it easy to reflect the user's
/// selection elsewhere in the UI.
///
/// In this example, we employ a ColorPicker to let users choose a preferred background color.
/// The selected color is immediately applied as the background of a sample view, allowing
/// real-time feedback.

import SwiftUI

struct ContentView: View {
    /// A bindable property that holds the selected color
    @State private var selectedColor: Color = Color.white

    /// The main view content which is rendered and displayed on the screen
    var body: some View {
        /// A VStack containing the ColorPicker and a sample view to display the selected color.
        VStack(spacing: 20) {
            /// The ColorPicker bound to the selectedColor property.
            /// When users select a color, it updates the property in real-time.
            ColorPicker("Choose a Background Color", selection: $selectedColor)

            /// A sample view that uses the selectedColor as its background.
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
                .border(Color.black, width: 5)
            
            
          // MyHStackView()
                

        }
        .padding()
    }
}

/*

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text 3")
                .foregroundColor(Color.yellow)
                .padding()
            Text("Text 4")
                .foregroundColor(Color.blue)
                .padding()
            
            Image(systemName: "square.and.arrow.down")
            
            
        }
    }
}

*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
