//
//  NavigationinSwiftUIApp.swift
//  NavigationinSwiftUI
//
//  Created by FCI on 09/12/24.
//
import SwiftUI
struct Person : Hashable {
    let name : String
}

struct NavigationinSwiftUIApp: View {
    var body: some View {
        NavigationStack {
            NavigationLink(value:Person(name: "Jyothika"))  {
                ZStack {
                    RoundedRectangle(cornerRadius:10)
                        .frame(width:200,height:50)
                        .foregroundStyle(.red)
                    Text("Navigate")
                        .foregroundStyle(.white)
                }
            }.navigationDestination(for: String.self) {
                value in
                Text("Screen2 - String, \(value)")
            }
            .navigationDestination(for: Int.self) {
                value in
                Text("Screen2 - Int, \(value)")
            }
            .navigationDestination(for: Person.self) {
                value in
                Text("Screen2 - Person, \(value.name)")
            }
        }
    }
}
    
    #Preview {
        NavigationinSwiftUIApp()
    }
  

//webservices, concurrency, operationqueues, text field validations







