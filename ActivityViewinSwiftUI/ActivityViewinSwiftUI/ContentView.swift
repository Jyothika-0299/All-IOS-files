//
//  ContentView.swift
//  ActivityViewinSwiftUI
//
//  Created by FCI on 09/12/24.
//
import SwiftUI

struct ContentView: View {
    
    let link = URL(string: "https://apple.com/")!
    
    var body: some View {
        
        VStack(spacing: 12) {
            ShareLink(item: link)
            
            ShareLink("Labeled Share Link", item: link)
            
            ShareLink(item: link) {
                Label("Share Link with Label builder", systemImage: "swift")
            }
            
            ShareLink(
                item: link,
                message: Text("Additional message content when sharing")
            )
            
            ShareLink(
                item: link,
                preview: SharePreview(
                    "Sharing Info",
                    image: Image(systemName: "swift")
                )
            ) {
                Label("Share Link with Preview", systemImage: "swift")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





