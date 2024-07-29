//
//  Book.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import Foundation

struct Book: Identifiable, Decodable {
    var id = UUID()
    let title: String
    let releaseDate: String
}
