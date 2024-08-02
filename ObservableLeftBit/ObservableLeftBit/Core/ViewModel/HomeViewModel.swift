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
    
    let manager = DataService()
    
    init(isLoading: Bool = false, error: Error? = nil, books: [Book] = []) {
        self.isLoading = isLoading
        self.error = error
        self.books = books
    }
}

extension HomeViewModel {
    
    func populateData() async {
        self.isLoading = true
        
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else { return }
        
        let request: URLRequest = URLRequest(url: url)
        
        do {
            let response = try await URLSession.shared.data(for: request).0
            let books = try JSONDecoder().decode([Book].self, from: response)
            self.books = books
        } catch {
            self.error = error
        }
        self.isLoading = false
    }
    
    
    
    func getBooks() async {
        self.isLoading = true
        
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else { return }
        
        do {
            let receivedBooks = try await manager.fetch(type: [Book].self, url: url)
            debugPrint(receivedBooks)
            self.books = receivedBooks
        } catch {
            self.error = error
        }
        self.isLoading = false
    }
}
