//
//  ContentView.swift
//  StepperSwiftUI
//
//  Created by FCI on 05/12/24.
//

/// https://developer.apple.com/documentation/swiftui/stepper
/// A user interface control that provides an intuitive way to adjust
/// a numerical value, typically within a predefined range.
///
/// In SwiftUI, the Stepper view allows users to increment or decrement
/// a value by tapping on the plus or minus buttons. It can work directly
/// with a binding to a value, ensuring the value changes as the stepper is adjusted.
/// Additionally, it can be combined with text or other views to describe its purpose.
///
/// In this example, we present a Stepper that lets users adjust the quantity
/// of an item. The current quantity is displayed next to the stepper.
///
/// Additional reference: How to create a stepper and read values from it
/// https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-stepper-and-read-values-from-it

import SwiftUI

struct ContentView: View {
    /// A bindable property that holds the current value for the stepper
    @State private var quantity: Int = 0
    
    @State private var quantity1: Int = 0
    
       let step = 5
       let range = 0...50

    /// The main view content which is rendered and displayed on the screen
    var body: some View {
        /// A VStack containing the Stepper and a text view displaying its current value.
        VStack {
            Text("Quantity: \(quantity)")
                .font(.title)
            
            /// A stepper that adjusts the quantity from 0 to 10.
            Stepper(value: $quantity, in: 0...10) {
                Text("Adjust Quantity")
            }
            
            Text("Quantity: \(quantity1)")
                .font(.title)
            
            Stepper(
                value: $quantity1,
                        in: range,
                        step: step
                    ) {
                        //Text("Current: \(quantity1) in \(range) " +
                            // "stepping by \(step)")
                    }
            
            
            
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
