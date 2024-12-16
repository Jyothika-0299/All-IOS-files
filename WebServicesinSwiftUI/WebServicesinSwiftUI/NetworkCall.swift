//
//  NetworkCall.swift
//  WebServicesinSwiftUI
//
//  Created by FCI on 09/12/24.
//

import Foundation

class NetworkCall : ObservableObject{
    
    @Published var posts = [Posts]()
    
    func loadPostData(completion:@escaping ([Posts]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let posts1 = try! JSONDecoder().decode([Posts].self, from: data!)
            DispatchQueue.main.async {
                
                print(url)
                print(data!)
                print(response!)
                print(posts1)
                
                completion(posts1)
                
            }
        }.resume()
        
    }
}

