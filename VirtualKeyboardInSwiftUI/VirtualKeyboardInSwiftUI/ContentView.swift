//
//  ContentView.swift
//  VirtualKeyboardInSwiftUI
//
//  Created by FCI on 05/12/24.
//

import SwiftUI
import Combine
/// https://developer.apple.com/design/human-interface-guidelines/virtual-keyboards



struct ContentView: View {
    @State private var defaultTitle = ""
    @State private var asciiTitle = ""
    @State private var numbersAndPunctuationTitle = ""
    @State private var urlTitle = ""
    @State private var numberTitle = ""
    @State private var phoneTitle = ""
    @State private var namePhoneTitle = ""
    @State private var emailTitle = ""
    @State private var decimalTitle = ""
    @State private var twitterTitle = ""
    @State private var webSearchTitle = ""
    @State private var asciiNumberTitle = ""
    var body: some View {
        Form {
            Group {
                TextField("Default", text: $defaultTitle)
                        
                TextField("Ascii Capable", text: $asciiTitle)
                        .keyboardType(.asciiCapable)
                        
                TextField("Numbers and Punctuation", text: $numbersAndPunctuationTitle)
                        .keyboardType(.numbersAndPunctuation)
                        
                TextField("URL", text: $urlTitle)
                        .keyboardType(.URL)
                        
                TextField("Numpad", text: $numberTitle)
                        .keyboardType(.numberPad)
                        
                TextField("Phonepad", text: $phoneTitle)
                        .keyboardType(.phonePad)
                }
                    
            Group {
                TextField("Name Phonepad", text: $namePhoneTitle)
                        .keyboardType(.namePhonePad)
                        
                TextField("Email", text: $emailTitle)
                        .keyboardType(.emailAddress)
                        
                TextField("Decimal Pad", text: $decimalTitle)
                        .keyboardType(.decimalPad)
                        
                TextField("Twitter", text: $twitterTitle)
                        .keyboardType(.twitter)
                        
                TextField("Web Search", text: $webSearchTitle)
                        .keyboardType(.webSearch)
                        
                TextField("Ascii Capable Numpad", text: $asciiNumberTitle)
                        .keyboardType(.asciiCapableNumberPad)
                    }
                }
                
            }
        }
            
       

#Preview {
    ContentView()
}
