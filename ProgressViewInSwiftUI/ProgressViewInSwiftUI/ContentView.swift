//
//  ContentView.swift
//  ProgressViewInSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

/// https://developer.apple.com/documentation/swiftui/progressview
/// A view that displays the progress towards completion of a task.
///
/// SwiftUI's ProgressView provides a way to visually indicate the progress of a task
/// or the duration of an activity. It can be shown as both a linear progress bar
/// (determinate mode) or as a circular activity indicator (indeterminate mode).
///
/// In the example below, we illustrate both modes of ProgressView.
/// The first one displays the linear progress of a task with a bindable fraction
/// of completion, while the second one shows an indeterminate progress, usually used
/// when the duration of the task is unknown.

struct ContentView: View {
    /// A bindable property that holds the fractional completion of a task (0.0 to 1.0)
    @State private var taskProgress: Double = 0
    
    @State private var progress = 0.6

    /// The main view content which is rendered and displayed on the screen
    
    var body: some View {
        
        /// A VStack containing the two styles of ProgressView.
        VStack(spacing: 30) {
            /// A linear progress bar bound to the taskProgress property.
           ProgressView("Task Progress", value: taskProgress, total: 1.0)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
            
            /// A circular activity indicator for indeterminate progress.
           // ProgressView()
            
            
            ProgressView(value: taskProgress)
                        Button("More") { taskProgress += 0.05 }
            
            
            ProgressView(value: progress)
                           .progressViewStyle(.circular)

            
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
