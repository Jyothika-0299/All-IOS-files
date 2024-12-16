//
//  ContentView.swift
//  ActionSheetInSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI

/// .confirmationDialog Modifier (Action Sheet)
/// Presents a confirmation dialog using data to produce the dialog’s content
/// and a localized string key for the title.
///
/// https://developer.apple.com/documentation/swiftui/view/confirmationdialog(_:ispresented:titlevisibility:presenting:actions:)-9ibgk

struct ContentView: View {
    
    @State private var isSheetShown = false
    @State private var selectedColor: Color = .white
    
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Button("Display Action Sheet Change Background Color") {
                isSheetShown = true
            }
           
            .confirmationDialog("Select Background Color", isPresented: $isSheetShown, titleVisibility: .visible) {
                Button("White") {
                    selectedColor = .white
                }
                
                Button("Black") {
                    selectedColor = .black
                }
                
                Button("Gray") {
                    selectedColor = .gray
                }
            }
            
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
