//
//  PostsModel.swift
//  WebServicesinSwiftUI
//
//  Created by FCI on 09/12/24.
//

import Foundation

struct Posts: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
