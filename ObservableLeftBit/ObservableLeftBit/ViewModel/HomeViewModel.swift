//
//  HomeViewModel.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var isLoading: Bool
    @Published var error: Swift.Error?
    @Published var books: [Book]
    
    init(isLoading: Bool = false, error: Error? = nil, books: [Book] = []) {
        self.isLoading = isLoading
        self.error = error
        self.books = books
    }
}
