//
//  ContentView.swift
//  NavigateBetweenViewsInSwiftUI
//
//  Created by FCI on 06/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        NavigationView {
                    NavigationLink {
                        // destination view to navigation to
                        SecondView()
                    } label: {
                        VStack {
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Hello, world!")
                        }
                        .padding()
            }
        }
         
         */
        
        
        NavigationView {
            ScrollView {
                NavigationLink("Hello, world!",
                               destination: SecondView())
                
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationBarHidden(true)
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }


                ,
                trailing:
                    NavigationLink(
                        destination: SecondView(),
                    label: {
                        Image(systemName: "gear")
                    })
                    .accentColor(.red)
            )
        }
     }
}

#Preview {
    ContentView()
}






