//
//  ContentView.swift
//  Shared
//
//  Created by FCI on 3/17/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var name: String = ""
    @State var quantity: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var coreDatainSwiftUI : FetchedResults<Item>

    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button("Add") {
                        addProduct()
                    }
                    Spacer()
                    NavigationLink(destination: ResultsView(name: name,
                                   viewContext: viewContext)) {
                        Text("Find")
                    }
                    Spacer()
                    Button("Clear") {
                        name = ""
                        quantity = ""
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(coreDatainSwiftUI) { Item in
                        HStack {
                            Text(Item.name ?? "Not found")
                            Spacer()
                            Text(Item.quantity ?? "Not found")
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                .navigationTitle("Item Database")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    private func addProduct() {
        
        withAnimation {
            let Item = Item(context: viewContext)
            Item.name = name
            Item.quantity = quantity
            
            saveContext()
        }
    }
    
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { coreDatainSwiftUI[$0] }.forEach(viewContext.delete)
                saveContext()
            }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

struct ResultsView: View {
    
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State var matches: [Item]?

    var body: some View {
       
        return VStack {
            
            List {
          
                ForEach(matches ?? []) { match in
                    HStack {
                        Text(match.name ?? "Not found")
                        Spacer()
                        Text(match.quantity ?? "Not found")
                    }
                }
            }
            .navigationTitle("Results")
        }
        .task {
            let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()

            fetchRequest.entity = Item.entity()
            fetchRequest.predicate = NSPredicate(
                format: "name CONTAINS %@", name
            )

            matches = try? viewContext.fetch(fetchRequest)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
